class Cfg3DEN {
	class Object {
		class AttributeCategories {
			class AAF_Attributes {
				displayName = "AAF Attributes";
				collapsed = 1;
				class Attributes {
					class stripperExcluder {
						displayName = "Exclude from gear stripper";
						tooltip = "Prevents unit being affected by the gear stripper";
						property = "stripperExcluder";
                        control = "Checkbox";
                        typeName = "BOOL";
                        defaultValue = "false";
						condition = "objectControllable";
						expression = "_this setVariable ['%s',_value];";
						unique = 0; 
						validate = "none"; 
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
