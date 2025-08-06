class ace_medical_treatment {
	class Medication{
		class Morphine {
            hrIncreaseLow[] = {0, 0};
            hrIncreaseNormal[] = {0, 0};
            hrIncreaseHigh[] = {0, 0};
			maxDose = 3704;
			timeTillMaxEffect = 10;
			viscosityChange = 0;
        };
		class Epinephrine {
			hrIncreaseLow[] = {80, 80};
			hrIncreaseNormal[] = {25, 40};
			hrIncreaseHigh[] = {0, 0};
			maxDose = 3704;
		};
	};

	class Bandaging {
		class BasicBandage {
			effectiveness = 3;
		};
	};
};
