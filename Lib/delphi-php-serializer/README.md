# delphi-php-serializer
Create serialized PHP structs with Delphi

# What does this do?
It solves a problem I had some time ago. I wanted to build structs in Delphi/Object Pascal which could be deserialized on PHP side. It's nothing much, but maybe somebody out there has exactly this problem too, and saves a bit time. My pleasure.

# Can you demonstrate?

Sure.

    var
    serializer : TPHPSerializer;
    begin
    serializer := TPHPSerializer.Create();
    serializer.Clear();

    serializer.ArrayStart(Length(obj.configs));
    for sw := 0 to Length(obj.configs) - 1 do
    begin
      serializer.AddInt(sw); // array index!
      serializer.CreateClass('EQUIP_LEVELUP_CONFIG_config_t', 3);
      serializer.AddField('req_exp');
      serializer.AddInt(obj.configs[sw].req_exp);
      serializer.AddField('addon_group');
      serializer.AddInt(obj.configs[sw].addon_group);
      serializer.AddField('money_cost');
      serializer.AddInt(obj.configs[sw].money_cost);
      serializer.CloseClass;
    end;
    serializer.CloseClass; // close array
  
Result can then be retrieved by:

    serializer.GetFinalSWON();
  
 You can then use this string with unserialize() PHP call, and like magic, have the object you described with delphi.
 
 Cheers.
