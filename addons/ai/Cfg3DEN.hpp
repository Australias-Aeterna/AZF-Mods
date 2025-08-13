class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class anzif_attributes {
                class Attributes {
                    class GVAR(isNotStripped) {
                        displayName = QUOTE(Exclude from gear stripper);
                        tooltip = QUOTE(Prevents unit being affected by the gear stripper);
                        property = QUOTE(excluder);
                        control = QUOTE(Checkbox);
                        expression = QUOTE(_this setVariable [ARR_2('%s',_value)]);
                        typeName = QUOTE(BOOL);
                        defaultValue = QUOTE(false);
                        condition = QUOTE(objectControllable);
                    };
                    /*
                    class scaredyCat 
                    {
                        displayName = "Enable ScaredyCat";
                        tooltip = "Unit will surrender if a player within 10m points a weapon at them and verbally orders them to surrender.";
                        property = "scaredyCat";
                        control = "CheckboxNumber";
                        typeName = "BOOL";
                        defaultValue = 0;
                        condition = "objectControllable";
                        expression = "_this setVariable ['%s',_value];";
                        unique = 0;
                        validate = "none";
                    };
                    */
                };
            };
        };
    };
};


//IDEA: Add checkboxes to override carry and drag limits on all box classes add to base class ReammoBox_F?
