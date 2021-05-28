unit osReportUtils;


interface

uses Classes, acCustomSQLMainDataUn, osSQLDataSet, SysUtils, DB, ppReport, daDataModule,
  daQueryDataView, ppTypes,daIDE, daDBExpress, ppCTDsgn, raIDE, myChkBox,
  ppModule, FMTBcd, osCustomDataSetProvider, SqlExpr,
  osSQLDataSetProvider, daSQl, osSQLQuery, osComboFilter, ppDBPipe, osClientDataSet,
  acReportContainer, Forms, osCustomMainFrm, acCustomReportUn;

  type TIdade = class
  private
    Fdias: integer;
    FdataReferencia: TDateTime;
  protected
    function getAnos: integer;
    function getDias: integer;
    function getMeses: integer;
    function getString: string;
  public
    constructor Create(dias: integer; referencia: TDateTime = 0);
    property dias: integer read getDias;
    property anos: integer read getAnos;
    property meses: integer read getMeses;
    property dataReferencia: TDateTime read FdataReferencia write FdataReferencia;
    property asString: string read getString;
  end;


  function getIdadeDias(idade: string; conn: TSQLConnection = nil): integer;
  function getTemplateByName(name: string; stream: TMemoryStream): boolean;
  function getTemplateByID(id: integer; stream: TMemoryStream; var config: TConfigImpressao): boolean;
  function getTemplateIDByName(name: string): integer;
  function getTemplateLaudoRascunho(name: string; stream: TMemoryStream; var config: TConfigImpressao): boolean;

  procedure replaceReportSQL(report: TppReport; template: TMemoryStream; strSQL: String);
  procedure replaceReportSQLAddParam(report: TppReport; template: TMemoryStream;
    strSelect: String; strWhere: String; strOrder: string = '');

  procedure replaceReportSQLAddWhere(report: TppReport; template: TMemoryStream;
    strWHERE: String);
  function tiraNumerosDoFinal(str: String): string;
  function ConvertMask(mask: string): string;
  procedure replaceReportSQL2(report: TppReport; template: TMemoryStream;
    strSQL: String; params: TStringList = nil; mapeamentos: TStringList = nil;
    recipient: TDataModule = nil);

implementation

uses daDataView, ppClass, FwConstants, DateUtils, Dialogs; // RelatorioEditFormUn

function getTemplateByName(name: string; stream: TMemoryStream): boolean;
var
  query: TosSQLDataset;
  report: string;
  ss: TStringStream;
begin
  name := UpperCase(Name);
  Result := false;
  report := TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).
    findReportByName(name); 
  if Length(report) > 0 then
  begin
    ss := TStringStream.Create(report);
    stream.LoadFromStream(ss);
    Result := True;
  end
  else
  begin
    query := TosSQLDataSet.Create(nil);
    try
      query.SQLConnection := acCustomSQLMainData.SQLConnectionMeta;
      query.CommandText := ' SELECT ' +
                           '   template, '+
                           '   ITEM_ID '+
                           ' FROM ' +
                           '   RB_ITEM '+
                           ' WHERE ' +
                           '   UPPER(name) like UPPER(' + quotedStr(name) + ')';
      query.Open;
      if query.RecordCount>0 then
      begin
        TBLOBField(query.fields[0]).SaveToStream(stream);
        TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).
          addReport(query.fields[1].AsInteger, name, TBLOBField(query.fields[0]).AsString);
        Result := true;
      end;
    finally
      FreeAndNil(query);
    end;
  end;
end;


function getTemplateLaudoRascunho(name: string; stream: TMemoryStream; var config: TConfigImpressao): boolean;
var
  query: TosSQLQuery;
  vIdRelatorio: Integer;
begin
  name := UpperCase(Name);
  Result := false;
  query := TosSQLQuery.Create(nil);
  try
    query.SQLConnection := acCustomSQLMainData.SQLConnectionMeta;
    query.CommandText := ' SELECT ' +
                         '   I.template, '+
                         '   I.ITEM_ID, '+
                         '   r.IdRelatorio '+
                         ' FROM ' +
                         '   RB_ITEM I '+
                         ' join relatorio r on r.item_id = I.item_id '+
                         ' join tipolaudo tp on tp.idrelatoriolaudo = r.idrelatorio '+
                         ' WHERE tp.rascunho = ''S'' ';
    query.open;
    if query.fields[0].AsString <> '' then
    begin
      TBLOBField(query.fields[0]).SaveToStream(stream);
      TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).
        addReport(query.fields[1].AsInteger, name, TBLOBField(query.fields[0]).AsString);
      Result := true;
    end;

    if Result then
    begin
      vIdRelatorio := query.FieldByName('IdRelatorio').AsInteger;
      query.Close;
      query.SQL.Text := ' select r.margemsuperior, ' +
                      ' r.margeminferior, ' +
                      ' r.margemesquerda, ' +
                      ' r.margemdireita, ' +
                      ' r.alturapapel, ' +
                      ' r.largurapapel, ' +
                      ' r.orientation, ' +
                      ' r.classeimpressora, ' +
                      ' r.tiposaida, ' +
                      ' rb.item_id from relatorio r'+
                      ' join rb_item rb on r.item_id = rb.item_id'+
                      ' where r.idrelatorio = '+IntToStr(vIdRelatorio);
      query.Open;
      if not query.IsEmpty then
      begin
        if not query.fieldByName('orientation').IsNull then
          config.orientation := query.fieldByName('orientation').AsInteger;
        if not query.fieldByName('larguraPapel').IsNull then
          config.larguraPapel := query.fieldByName('larguraPapel').AsInteger;
        if not query.fieldByName('alturaPapel').IsNull then
          config.alturaPapel := query.fieldByName('alturaPapel').AsInteger;
        if not query.fieldByName('margemSuperior').IsNull then
          config.margemSuperior := query.fieldByName('margemSuperior').AsInteger;
        if not query.fieldByName('margemInferior').IsNull then
          config.margemInferior := query.fieldByName('margemInferior').AsInteger;
        if not query.fieldByName('margemEsquerda').IsNull then
          config.margemEsquerda := query.fieldByName('margemEsquerda').AsInteger;
        if not query.fieldByName('margemDireita').IsNull then
          config.margemDireita := query.fieldByName('margemDireita').AsInteger;
       // if not query.fieldByName('tipoSaida').IsNull then
       //   config.tipoSaida := query.fieldByName('tipoSaida').AsString;
      end;
    end;
  finally
    FreeAndNil(query);
  end;
end;

function getTemplateIDByName(name: string): integer;
var
  query: TosSQLDataset;
  id: Integer;
begin
  name := UpperCase(Name);
  id := TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).
    findRportIdByName(name);
  if id <> -1 then
  begin
    Result := id;
  end
  else
  begin
    query := TosSQLDataSet.Create(nil);
    try
      query.SQLConnection := acCustomSQLMainData.SQLConnection;
      query.CommandText := ' SELECT ' +
                           '   ITEM_ID '+
                           ' FROM ' +
                           '   RB_Item '+
                           ' WHERE ' +
                           '   UPPER(name) like UPPER(' + quotedStr(name) + ')';
      query.Open;
      Result := -1;
      if not query.eof then
        Result := query.fields[0].asInteger;
    finally
      FreeAndNil(query);
    end;
  end;
end;


function getTemplateById(id: integer; stream: TMemoryStream; var config: TConfigImpressao): boolean;
var
  query: TosSQLDataset;
  report: string;
  ss: TStringStream;
  ComponenteRelatorio: TacReportContainer;
begin
  Result := false;
  query := TosSQLDataSet.Create(nil);
  try
    query.SQLConnection := acCustomSQLMainData.SQLConnection;
    query.CommandText := ' SELECT ' +
                         '   template, '+
                         '   name '+
                         ' FROM ' +
                         '   RB_ITEM '+
                         ' WHERE ' +
                         '   ITEM_ID = ' + intToStr(id);
    query.Open;
    if query.RecordCount>0 then
      config.NomeRelatorio := query.FieldByName('name').AsString;

    if Application.MainForm <> nil then
      report := TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).findReportById(id)
    else
    begin
      //Dessa forma o agendador pode ter acesso ao componente de relatório
      ComponenteRelatorio := TacReportContainer.Create(nil);
      report := ComponenteRelatorio.findReportById(id);
    end;

    try
      if Length(report) > 0 then
      begin
        try
          ss := TStringStream.Create(report);
          stream.LoadFromStream(ss);
          Result := True;
        finally
          FreeAndNil(ss);
        end;
      end
      else
      begin
        if query.RecordCount>0 then
        begin
          TBLOBField(query.fields[0]).SaveToStream(stream);
          if Application.MainForm <> nil then
            TacReportContainer(Application.MainForm.FindComponent('FReportDepot')).addReport(id, query.fields[1].AsString, query.fields[0].AsString)
          else
            ComponenteRelatorio.addReport(id, query.fields[1].AsString, query.fields[0].AsString);
          config.NomeRelatorio := query.FieldByName('name').AsString;
          Result := True;
        end;
      end;
    finally
      if Application.MainForm = nil then
        FreeAndNil(ComponenteRelatorio);
    end;
  finally
    FreeAndNil(query);
  end;
end;

procedure replaceReportSQLAddWhere(report: TppReport; template: TMemoryStream;
  strWHERE: String);
var
  lDataModule: TdaDataModule;
  liIndex, i: Integer;
  lDataView: TdaDataView;
  nomePipeline: string;
  aSQL: TdaSQL;
begin
  if template.Size <> 0 then
    report.Template.LoadFromStream(template);

  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
    begin
      liIndex := 0;

      while liIndex < lDatamodule.DataViewCount do
      begin
        lDataView := lDataModule.DataViews[liIndex];
        for i := 0 to lDataView.DataPipelineCount-1 do
        begin
          nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
          if UpperCase(nomePipeline) = 'PIPELINE' then
          begin
            aSQL := TdaQueryDataView(lDataView).SQL;
            aSQL.EditSQLAsText := True;
            aSQL.SQLText.Add(strWHERE);
          end;
        end;
        inc(liIndex);
      end;
    end;
end;


procedure replaceReportSQL2(report: TppReport; template: TMemoryStream;
  strSQL: String; params: TStringList; mapeamentos: TStringList;
  recipient: TDataModule);
var
  liIndex: Integer;
  lDataModule: TdaDataModule;
  lDataView: TdaDataView;
  aSQL: TDaSQL;
  i: integer;
  nomePipeline: string;
  pipeline: TComponent;
  function getSQL(nomePipeline: String): string;
  var
    i: integer;
    comp: TComponent;
  begin
    for i := 0 to mapeamentos.Count-1 do
    begin
      if UpperCase(nomePipeline) = UpperCase(Copy(mapeamentos[i], 0, pos(',',mapeamentos[i])-1)) then
      begin
        comp := recipient.FindComponent(copy(mapeamentos[i], pos(',',mapeamentos[i])+1,length(mapeamentos[i])));
        result := (comp as TSQLDataSet).CommandText;
        exit;
      end;
    end;
  end;

  function substParams(strSQL: String): string;
  var
    i: Integer;
    nomeParam: string;
    valor: integer;
  begin
    for i := 0 to params.Count-1 do
    begin
      nomeParam := copy(params[i], 0, pos('=', params[i])-1);
      valor := strToInt(copy(params[i], pos('=', params[i])+1, length(params[i])));
      while Pos(':'+upperCase(nomeParam), upperCase(strSQL))>0 do
      begin
        strSQL := copy(strSQL, 0, Pos(':'+upperCase(nomeParam), upperCase(strSQL))-1) + intToStr(valor) +
          copy(strSQL,Pos(':'+upperCase(nomeParam), upperCase(strSQL))+1+length(':'+nomeParam),length(strSQL))
      end;
      result := StrSQL;
    end;
  end;
begin
  report.Template.LoadFromStream(template);

//  aSQL := nil;

  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
    begin
      liIndex := 0;

      while liIndex < lDatamodule.DataViewCount do
      begin
        lDataView := lDataModule.DataViews[liIndex];
        for i := 0 to lDataView.DataPipelineCount-1 do
        begin
          nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
          if recipient<>nil then
          begin
            pipeline := recipient.FindComponent(nomePipeline);

            if TosClientDataSet(TppDBPipeline(pipeline).DataSource.DataSet).dataProvider<>nil then
              strSQL := TosSQLDataSet(TosSQLDataSetProvider(TosClientDataSet(TppDBPipeline(pipeline).DataSource.DataSet).dataProvider).dataset).commandtext
            else
              strSQL := getSQL(nomePipeline);

            strSQL := substParams(strSQL);

            aSQL := TdaQueryDataView(lDataView).SQL;
            aSQL.EditSQLAsText := True;
            if strSQL <> '' then
              aSQL.SQLText.Text := strSQL;
          end;
        end;
        inc(liindex);
      end;
    end;
end;

{-------------------------------------------------------------------------
 Objetivo   > Esta função foi criada para que se ache componentes renomeados
                pelo delphi. Por exemplo Pipeline vira Pipeline1
 Parâmetros > str: a string a ser alterada
 Retorno    >
 Criação    >
 Observações> Comentário inicializado em 07/03/2006 por Ricardo N. Acras
 Atualização> 07/03/2006 - Inserido inicialização do index
 ------------------------------------------------------------------------}
function tiraNumerosDoFinal(str: String): string;
var
  i, index: integer;
begin
  index := 0;
  for i := length(str) downto 0 do
  begin
    if not((Ord(str[i])>=48) AND (Ord(str[i])<=57)) then
    begin
      index := i;
      break;
    end;
  end;
  result := copy(str, 0, index);
end;

procedure replaceReportSQL(report: TppReport; template: TMemoryStream; strSQL: String);
var
  liIndex, i: Integer;
  lDataModule: TdaDataModule;
  lDataView: TdaDataView;
  aSQL: TDaSQL;
  nomePipeline: String;
begin
  report.Template.LoadFromStream(template);

  aSQL := nil;

  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
    begin

      liIndex := 0;

      while (liIndex < lDatamodule.DataViewCount) and (aSQL = nil) do
        begin

          lDataView := lDataModule.DataViews[liIndex];
          if (lDataView <> nil) and (lDataView is TdaQueryDataView) and (Report.Datapipeline <> nil)
            and (Report.DataPipeline.Dataview = lDataview) then
          begin
            for i := 0 to lDataView.DataPipelineCount-1 do
            begin
              nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
              if (UpperCase(nomePipeline)=upperCase(report.DataPipeline.Name)) then
              begin
                aSQL := TdaQueryDataView(lDataView).SQL;
                aSQL.EditSQLAsText := True;
                if strSQL <> '' then
                  aSQL.SQLText.Text := strSQL;
              end;
            end;
          end;

          Inc(liIndex);

        end;
    end;
end;

function ConvertMask(mask: string): string;
const
  point: char = '.';
  comma: char = ',';
var
  n: integer;
  i: integer;
  c: char;
begin
  n := Length(mask);
  if n > 0 then
  begin
    SetLength(Result, n);
    for i := 1 to n do
    begin
      c := mask[i];
      if c = comma then
        c := point
      else if c = point then
        c := comma;
      Result[i] := c;
    end;
  end
  else
    Result := '';
end;

{ TIdade }

constructor TIdade.Create(dias: integer; referencia: TDateTime = 0);
begin
  Fdias := dias;
  if referencia = 0 then
    dataReferencia := acCustomSQLMainData.GetServerDate
  else
    dataReferencia := referencia  
end;

function TIdade.getAnos: integer;
var
  dia, mes, ano: word;
  diaAtual, mesAtual, anoAtual: word;
  numAnos: integer;
begin
  DecodeDate(dataReferencia, anoAtual, mesAtual, diaAtual);
  DecodeDate(dataReferencia-Fdias, ano, mes, dia);

  //calcular o número de anos que a pessoa possui
  numAnos := anoAtual - ano;
  //se o mês atual é maior que o mês do nascimento, já fechou o último ano
  //  nenhum cálculo adicional necessário
  //se o mês é menor ou o mês é igual mas o dia é menor deve decrementar o ano
  if ((mesAtual<mes) OR ((mesAtual=mes)AND(diaAtual<dia))) then
    numAnos := numAnos-1;

  result := numAnos;
end;

function TIdade.getMeses: integer;
var
  dia, mes, ano: word;
  diaAtual, mesAtual, anoAtual: word;
  numMeses: integer;
begin
  DecodeDate(dataReferencia, anoAtual, mesAtual, diaAtual);
  DecodeDate(dataReferencia-Fdias, ano, mes, dia);

  //calcular o número de meses que a pessoa possui
  numMeses := getAnos*12;
  if mesAtual<mes then
    numMeses := numMeses + 12-mes+mesAtual;
  if mes<mesAtual then
    numMeses := numMeses + mesAtual-mes;
  if mes=mesAtual then
    numMeses:= 12;

  //corrigir o número de meses pois pode ainda não ter fechado o último
  if diaAtual<dia then
    numMeses := numMeses-1;

  result := numMeses;
end;

function TIdade.getDias: integer;
begin
  result := Fdias;
end;

function TIdade.getString: string;
var
  mes, mesano: word;
  ano, ano2: Integer;
  dataNascimento: TDateTime;
  Total_dias: Real;
  Count: Integer;
begin
  Count:= 1;
  DataNascimento:= FdataReferencia - Fdias;

  Total_dias:= FDias;
  Ano := StrToInt(FormatDateTime('YY', DataNascimento));
  Ano2 := StrToInt(FormatDateTime('YYYY', DataNascimento));
  while Total_dias >= DaysInAYear(Ano2) do
  begin
    if (IsLeapYear(Ano2)) and (Count = 1) then
    begin
      Total_dias := Total_dias + 1;
    end;
    Total_dias := Total_dias - DaysInAYear(Ano2);
    Ano := Ano + 1;
    Ano2 := Ano2 + 1;
    inc(count);
  end;
  
  Mes := StrToInt(FormatDateTime('MM', DataNascimento));
  mesano:= Mes;
  while Total_dias > 28 do
  begin
      if Total_dias >= DaysInAMonth(Ano, Mes) then
      begin
        
        Total_dias := Total_dias - DaysInAMonth(Ano, mesano);
        Mes := Mes + 1;
        mesano:= mesano + 1;
        if mesano > 12 then
          mesano:= 1;
      end
      else
        break;
  end;
  Ano := Ano - StrToInt(FormatDateTime('YY', DataNascimento));
  Mes := Mes - StrToInt(FormatDateTime('MM', DataNascimento));

  Result:= '';
  if Ano > 0 then
  begin
    result:= IntToStr(Ano);
    if ano > 1 then
      result:= result + ' anos '
    else
      result:= result + ' ano ';
  end;
  if (Mes > 0) then
  begin
    if Ano > 0 then
      Result:= Result + 'e ';
    result:= Result + IntToStr(Mes);
    if Mes > 1 then
      result:= result + ' meses '
    else
      result:= result + ' mês ';
  end;
    
  if (Total_dias > 0) and (Ano < 1) then
  begin
    if (Ano > 0) or (Mes > 0) then
      Result:= Result + 'e ';
    result:= Result + FloatToStr(Total_dias);
    if Total_dias > 1 then
      result:= result + ' dias '
    else
      result:= result + ' dia ';
  end
  else if (Total_dias = 0) and (meses = 12) and (ano = 0) then //recem nascido
    result:= '0 dia'; 
end;

function getIdadeDias(idade: string; conn: TSQLConnection = nil): integer;
var
  tipoIdade: String;
  original: integer;
  data: TDateTime;
begin
  result := 0;
  idade := trim(idade);
  tipoIdade := idade[length(idade)];
  original := StrToInt(copy(idade, 1, length(idade)-1));
  data := acCustomSQLMainData.GetServerDate(conn);
  case tipoIdade[1] of
    'd': result := DaysBetween(data, IncDay(data, original * -1));
    'm': result := DaysBetween(data, INCMONTH(data, original * -1));
    'a': result := DaysBetween(data, IncYear(data, original * -1));
  end;
end;

procedure replaceReportSQLAddParam(report: TppReport; template: TMemoryStream;
  strSelect: String; strWhere: String; strOrder: string);
var
  liIndex, i, y: Integer;
  lDataModule: TdaDataModule;
  lDataView: TdaDataView;
  aSQL: TDaSQL;
  nomePipeline: String;
  crit: TdaCriteria;
  ord: TdaField;
  criterios, item: TStringList;
begin
  report.Template.LoadFromStream(template);

  aSQL := nil;

  lDataModule := daGetDataModule(Report.MainReport);

  if (lDataModule <> nil) then
  begin

    liIndex := 0;

    while (liIndex < lDatamodule.DataViewCount) and (aSQL = nil) do
    begin

      lDataView := lDataModule.DataViews[liIndex];
      if (lDataView <> nil) and (lDataView is TdaQueryDataView) and (Report.Datapipeline <> nil)
        and (Report.DataPipeline.Dataview = lDataview) then
      begin
        for i := 0 to lDataView.DataPipelineCount-1 do
        begin
          nomePipeline := tiraNumerosDoFinal(lDataView.DataPipelines[i].Name) ;
          if (UpperCase(nomePipeline)=upperCase(report.DataPipeline.Name)) then
          begin
            aSQL := TdaQueryDataView(lDataView).SQL;
            if aSQL.EditSQLAsText then
            begin
              if strSelect <> '' then
                aSQL.SQLText.Text := strSelect;
            end
            else
            begin
              if strWhere <> '' then
              begin
                crit := aSQL.AddCriteria(dacrField);
                crit.Expression := '1';
                crit.Value := '1 AND '+strWhere;
              end;

              if strOrder <> '' then
              begin
                try
                  criterios := TStringList.Create;

                  criterios.Delimiter := ',';
                  criterios.DelimitedText :=
                    '"' + StringReplace(strOrder, ',', '"' + ',' + '"', [rfReplaceAll]) + '"';

                  for y := 0 to criterios.Count -1 do
                  begin
                    try
                      item := TStringList.Create;
                      item.Delimiter := ' ';
                      item.DelimitedText := criterios.Strings[y]; 

                      ord := aSQL.GetFieldForSQLFieldName(item.Strings[0]).Clone(nil);
                      ord.ChildType := 2;

                      if (item.Count = 2) and (UpperCase(item.Strings[1]) = 'DESC') then
                        aSQL.AddOrderByField(ord,False)
                      else
                        aSQL.AddOrderByField(ord,True);
                    finally
                      FreeAndNil(ord);
                      FreeAndNil(item);
                    end;
                  end;
                finally
                  FreeAndNil(criterios);
                end;
              end;
            end;
            if osCustomMainForm.ShowQueryAction.Checked then
              ShowMessage(aSQL.MagicSQLText.Text);
          end;
        end;
      end;

      Inc(liIndex);

    end;
  end;
end;

end.
