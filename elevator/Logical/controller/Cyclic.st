
PROGRAM _CYCLIC
	(* Insert code here *)
	(*下列代码只是为了测试*)
	
	
	LeftTower.Signal_Start_DoorMotor_P := LeftCabin.Key_Open ;
	LeftTower.Signal_Start_DoorMotor_N := LeftCabin.Key_Close ;
	
	RightTower.Signal_Start_DoorMotor_P := RightCabin.Key_Open ;
	RightTower.Signal_Start_DoorMotor_N := RightCabin.Key_Close ;
	

	
	IF LeftCabin.Display_Floor1Selected = UnChecked AND LeftCabin.Key_Floor1 =1 THEN
		LeftCabin.Display_Floor1Selected := Checked;
	END_IF	
	
	IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Key_Floor2 =1 THEN
		LeftCabin.Display_Floor2Selected := Checked;
	END_IF	
	IF LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Key_Floor3 =1 THEN
		LeftCabin.Display_Floor3Selected := Checked;
	END_IF	
	IF LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Key_Floor4 =1 THEN
		LeftCabin.Display_Floor4Selected := Checked;
	END_IF	
	IF LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Key_Floor5 =1 THEN
		LeftCabin.Display_Floor5Selected := Checked;
	END_IF	
	IF LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Key_Floor6 =1 THEN
		LeftCabin.Display_Floor6Selected := Checked;
	END_IF	
	IF LeftCabin.Display_Floor7Selected = UnChecked AND LeftCabin.Key_Floor7 =1 THEN
		LeftCabin.Display_Floor7Selected := Checked;
	END_IF	
	
	IF RightCabin.Display_Floor1Selected = UnChecked AND RightCabin.Key_Floor1 =1 THEN
		RightCabin.Display_Floor1Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Key_Floor2 =1 THEN
		RightCabin.Display_Floor2Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Key_Floor3 =1 THEN
		RightCabin.Display_Floor3Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Key_Floor4 =1 THEN
		RightCabin.Display_Floor4Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Key_Floor5 =1 THEN
		RightCabin.Display_Floor5Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Key_Floor6 =1 THEN
		RightCabin.Display_Floor6Selected := Checked;
	END_IF	
	IF RightCabin.Display_Floor7Selected = UnChecked AND RightCabin.Key_Floor7 =1 THEN
		RightCabin.Display_Floor7Selected := Checked;
	END_IF	

	
	(*右电梯轿厢内部响应*)
	IF (RightCabin.Display_Floor2Selected = Checked AND RightCabin.Display_Current_Floor = 1) 
		OR (RightCabin.Display_Floor3Selected = Checked AND (RightCabin.Display_Current_Floor = 1 OR RightCabin.Display_Current_Floor = 2)) 
		OR (RightCabin.Display_Floor4Selected = Checked AND (RightCabin.Display_Current_Floor = 1 OR RightCabin.Display_Current_Floor = 2 OR RightCabin.Display_Current_Floor = 3) )
		OR (RightCabin.Display_Floor5Selected = Checked AND (RightCabin.Display_Current_Floor = 1 OR RightCabin.Display_Current_Floor = 2 OR RightCabin.Display_Current_Floor = 3 OR RightCabin.Display_Current_Floor = 4) )
		OR (RightCabin.Display_Floor6Selected = Checked AND (RightCabin.Display_Current_Floor = 1 OR RightCabin.Display_Current_Floor = 2 OR RightCabin.Display_Current_Floor = 3 OR RightCabin.Display_Current_Floor = 4 OR RightCabin.Display_Current_Floor = 5) )
		OR (RightCabin.Display_Floor7Selected = Checked AND (RightCabin.Display_Current_Floor = 1 OR RightCabin.Display_Current_Floor = 2 OR RightCabin.Display_Current_Floor = 3 OR RightCabin.Display_Current_Floor = 4 OR RightCabin.Display_Current_Floor = 5 OR RightCabin.Display_Current_Floor = 6 OR RightCabin.Display_Current_Floor = 7) )
		THEN UP := 1;

	ELSE UP := 2;
	END_IF	
	

		
		
		
		
IF 	UP=1 THEN	
		
	IF RightCabin.Display_Floor2Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 2 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor2Selected := UnChecked;
			END_IF
		END_IF
	END_IF

	
	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 3 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor3Selected := UnChecked;
			END_IF
		END_IF
	END_IF
	
	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 4 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor4Selected := UnChecked;
			END_IF
		END_IF
	END_IF
	
	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor5Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 5 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor5Selected := UnChecked;
			END_IF
		END_IF
	END_IF	
	
	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor6Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 6 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor6Selected := UnChecked;
			END_IF
		END_IF
	END_IF	

	IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor7Selected = Checked THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 7 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				RightCabin.Display_Floor7Selected := UnChecked;
			END_IF
		END_IF
	END_IF	
END_IF

	IF 	UP=2 THEN	
		
		IF RightCabin.Display_Floor6Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 6 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor6Selected := UnChecked;
				END_IF
			END_IF
		END_IF

	
		IF RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor5Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 5 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor5Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor4Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 4 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor4Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor3Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 3 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor3Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	
		IF RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor2Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 2 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor2Selected := UnChecked;
				END_IF
			END_IF
		END_IF	

		IF RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor1Selected = Checked THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 1 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RightCabin.Display_Floor1Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	END_IF	

(*左电梯轿厢内部响应*)
	IF (LeftCabin.Display_Floor2Selected = Checked AND LeftCabin.Display_Current_Floor = 1) 
		OR (LeftCabin.Display_Floor3Selected = Checked AND (LeftCabin.Display_Current_Floor = 1 OR LeftCabin.Display_Current_Floor = 2)) 
		OR (LeftCabin.Display_Floor4Selected = Checked AND (LeftCabin.Display_Current_Floor = 1 OR LeftCabin.Display_Current_Floor = 2 OR LeftCabin.Display_Current_Floor = 3) )
		OR (LeftCabin.Display_Floor5Selected = Checked AND (LeftCabin.Display_Current_Floor = 1 OR LeftCabin.Display_Current_Floor = 2 OR LeftCabin.Display_Current_Floor = 3 OR LeftCabin.Display_Current_Floor = 4) )
		OR (LeftCabin.Display_Floor6Selected = Checked AND (LeftCabin.Display_Current_Floor = 1 OR LeftCabin.Display_Current_Floor = 2 OR LeftCabin.Display_Current_Floor = 3 OR LeftCabin.Display_Current_Floor = 4 OR LeftCabin.Display_Current_Floor = 5) )
		OR (LeftCabin.Display_Floor7Selected = Checked AND (LeftCabin.Display_Current_Floor = 1 OR LeftCabin.Display_Current_Floor = 2 OR LeftCabin.Display_Current_Floor = 3 OR LeftCabin.Display_Current_Floor = 4 OR LeftCabin.Display_Current_Floor = 5 OR LeftCabin.Display_Current_Floor = 6 OR LeftCabin.Display_Current_Floor = 7) )
		THEN DOL := 1;
	
	ELSE DOL := 2;
	END_IF	
	

		
		
		
		
	IF 	DOL=1 THEN	
		
		IF LeftCabin.Display_Floor2Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor2Selected := UnChecked;
				END_IF
			END_IF
		END_IF

	
		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor3Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor4Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor5Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor5Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	
		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor6Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor6Selected := UnChecked;
				END_IF
			END_IF
		END_IF	

		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor7Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 7 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor7Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	END_IF

	IF 	DOL=2 THEN	
		
		IF LeftCabin.Display_Floor6Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor6Selected := UnChecked;
				END_IF
			END_IF
		END_IF

	
		IF LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor5Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor5Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor4Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor4Selected := UnChecked;
				END_IF
			END_IF
		END_IF
	
		IF LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor3Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor3Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	
		IF LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor2Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor2Selected := UnChecked;
				END_IF
			END_IF
		END_IF	

		IF LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor1Selected = Checked THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 1 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					LeftCabin.Display_Floor1Selected := UnChecked;
				END_IF
			END_IF
		END_IF	
	END_IF	

	
	(*轿厢外部上升响应*)	
	IF(RightCabin.Display_Floor1Selected = UnChecked AND RightCabin.Display_Floor2Selected = UnChecked AND RightCabin.Display_Floor3Selected = UnChecked AND RightCabin.Display_Floor4Selected = UnChecked AND RightCabin.Display_Floor5Selected = UnChecked AND RightCabin.Display_Floor6Selected = UnChecked AND RightCabin.Display_Floor7Selected = UnChecked ) 
		THEN KONGR:=1;
	ELSE KONGR:=2;
	END_IF	
	
	IF(LeftCabin.Display_Floor1Selected = UnChecked AND LeftCabin.Display_Floor2Selected = UnChecked AND LeftCabin.Display_Floor3Selected = UnChecked AND LeftCabin.Display_Floor4Selected = UnChecked AND LeftCabin.Display_Floor5Selected = UnChecked AND LeftCabin.Display_Floor6Selected = UnChecked AND LeftCabin.Display_Floor7Selected = UnChecked ) 
		THEN KONGL:=1;
	ELSE
		 KONGL:=2;
	END_IF	
	
    IF Floor1Panel.Key_Up = 1 THEN FLOOR1U:=1;
	END_IF

	IF Floor2Panel.Key_Up = 1 THEN FLOOR2U:=1;
	END_IF
	
	IF Floor3Panel.Key_Up = 1 THEN FLOOR3U:=1;
	END_IF
	
	IF Floor4Panel.Key_Up = 1 THEN FLOOR4U:=1;
	END_IF
	
	IF Floor5Panel.Key_Up = 1 THEN FLOOR5U:=1;
	END_IF
	
	IF Floor6Panel.Key_Up = 1 THEN FLOOR6U:=1;
	END_IF
	
	IF Floor7Panel.Key_Up = 1 THEN FLOOR7U:=1;
	END_IF
	
	
	
	
	IF FLOOR1U=1 AND KONGR=1 AND RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0 THEN  
		RB1 := 1;
		FLOOR1U := 0;     (*若1层呼叫，右侧空闲，右侧电梯未因响应楼层而忙碌，那么RB1置1，表示右侧电梯为响应1层而忙碌，呼叫置零*)
	END_IF
	IF RB1 = 1 THEN
	
		IF RightCabin.Display_Current_Floor = 1 THEN  (*若电梯目前楼层为1层，则执行此分支*)
		
		
				RightTower.Signal_Start_CabinMotor_P := 0;  
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
			
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				IF RightTower.Sensor_DoorClosed = TRUE THEN
					RightTower.Signal_Start_DoorMotor_N := 0;
					FLOOR1U := 0;
				    RB1 := 0;
				END_IF
			END_IF
		END_IF
END_IF


	IF FLOOR1U=1 AND KONGR=1 AND RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0 THEN  
		RB1 := 1;
		FLOOR1U := 0;
	END_IF
	IF RB1 = 1 THEN
		IF RightCabin.Display_Current_Floor >=1 THEN  (*若电梯目前楼层高于1层，则执行此分支*)
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 1 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RB1 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR1U=1  AND KONGL=1 AND (RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL1 := 1;        (*若1层呼叫，左侧空闲，右侧忙碌，那么RL1置1，表示左侧电梯为响应1层而忙碌，呼叫置零*)
		FLOOR1U :=0;
	END_IF 
	IF RL1 = 1 THEN
		IF LeftCabin.Display_Current_Floor = 1 THEN    (*若电梯目前楼层为1层，则执行此分支*)
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL1 := 0;
				END_IF
			END_IF
		END_IF



	IF FLOOR1U=1   AND KONGL=1 AND (RB2=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN    
		RL1 := 1;
		FLOOR1U :=0;
	END_IF	
	IF RL1 = 1 THEN
		IF LeftCabin.Display_Current_Floor >=1 THEN     (*若电梯目前楼层高于1层，则执行此分支*)
			LeftTower.Signal_Start_CabinMotor_N := 1; 
			IF LeftCabin.Display_Current_Floor = 1 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL1 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	
		
	IF FLOOR2U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB2 := 1;
		FLOOR2U := 0;
	END_IF
	IF RB2 = 1 THEN
		IF RightCabin.Display_Current_Floor <=2 THEN
		RightTower.Signal_Start_CabinMotor_P := 1;
		IF RightCabin.Display_Current_Floor = 2 THEN
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR2U := 0;
					RB2 := 0;
			END_IF
		END_IF
	END_IF
END_IF


	IF FLOOR2U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB2 := 1;
		FLOOR2U := 0;
	END_IF
	IF RB2 = 1 THEN
		IF RightCabin.Display_Current_Floor >=2 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 2 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR2U := 0;
					RB2 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR2U=1  AND KONGL=1 AND (RB1=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN 
		RL2 := 1;
		FLOOR2U := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor <=2 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL2 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR2U=1   AND KONGL=1 AND (RB1=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL2 := 1;
		FLOOR2U := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor >=2 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL2:= 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR3U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB3 := 1;
		FLOOR3U := 0;
	END_IF
	IF RB3 = 1 THEN
		IF RightCabin.Display_Current_Floor <=3 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 3 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR3U := 0;
					RB3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF



	IF FLOOR3U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB3 := 1;
		FLOOR3U := 0;
	END_IF
	IF RB3 = 1 THEN
		IF RightCabin.Display_Current_Floor >=3 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 3 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR3U := 0;
					RB3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR3U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL3 := 1;
		FLOOR3U := 0;
	END_IF
	IF RL3=1 THEN
		IF LeftCabin.Display_Current_Floor <=3 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR3U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL3 := 1;
		FLOOR3U := 0;
	END_IF
	IF RL3=1 THEN
		IF LeftCabin.Display_Current_Floor >=3 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	


	IF FLOOR4U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB4 := 1;
		FLOOR4U := 0;
	END_IF
	IF RB4 = 1 THEN
		IF RightCabin.Display_Current_Floor <=4 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 4 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR4U := 0;
					RB4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR4U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB4 := 1;
		FLOOR4U := 0;
	END_IF
	IF RB4 = 1 THEN
		IF RightCabin.Display_Current_Floor >=4 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 4 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR4U := 0;
					RB4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR4U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN 
		RL4 := 1;
		FLOOR4U := 0;
	END_IF
	IF RL4=1 THEN
		IF LeftCabin.Display_Current_Floor <=4 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR4U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL4 := 4;
		FLOOR4U := 0;
	END_IF
	IF RL4=1 THEN
		IF LeftCabin.Display_Current_Floor >=4 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR5U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB5 := 1;
		FLOOR5U := 0;
	END_IF
	IF RB5 = 1 THEN
		IF RightCabin.Display_Current_Floor <=5 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 5 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR5U := 0;
					RB5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR5U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB5 := 1;
		FLOOR5U := 0;
	END_IF
	IF RB5 = 1 THEN
		IF RightCabin.Display_Current_Floor >=5 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 5 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR5U := 0;
					RB5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR5U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB6=1 OR RB7=1) THEN 
		RL5 := 1;
		FLOOR5U := 0;
	END_IF
	IF RL5=1 THEN
		IF LeftCabin.Display_Current_Floor <=5 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR5U=1  AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB6=1 OR RB7=1) THEN
		RL5 := 1;
		FLOOR5U := 0;
	END_IF
	IF RL5=1 THEN
		IF LeftCabin.Display_Current_Floor >=5 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR6U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB6 := 1;
		FLOOR6U := 0;
	END_IF
	IF RB6 = 1 THEN
		IF RightCabin.Display_Current_Floor <=6 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 6 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR6U := 0;
					RB6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR6U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB6 := 1;
		FLOOR6U := 0;
	END_IF
	IF RB6 = 1 THEN
		IF RightCabin.Display_Current_Floor >=6 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 6 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR6U := 0;
					RB6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR6U=1  AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB7=1) THEN
		RL6 := 1;
		FLOOR6U := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor <=6 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR6U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB7=1) THEN
		RL6 := 1;
		FLOOR6U := 0;
	END_IF
	IF RL6=1 THEN
		IF LeftCabin.Display_Current_Floor >=6 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR7U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB7 := 1;
		FLOOR7U := 0;
	END_IF
	IF RB7 = 1 THEN
		IF RightCabin.Display_Current_Floor <=7 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 7 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR7U := 0;
					RB7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR7U=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB7 := 1;
		FLOOR7U := 0;
	END_IF
	IF RB7 = 1 THEN
		IF RightCabin.Display_Current_Floor >=7 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 7 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR7U := 0;
					RB7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR7U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1) THEN
		RL7 := 1;
		FLOOR7U := 0;
	END_IF
	IF RL7=1 THEN
		IF LeftCabin.Display_Current_Floor <=7 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 7 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR7U=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1) THEN
		RL7 := 1;
		FLOOR7U := 0;
	END_IF
	IF RL7=1 THEN
		IF LeftCabin.Display_Current_Floor >=3 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	(*轿厢外部下降响应*)
	IF Floor1Panel.Key_Down = 1 THEN FLOOR1D:=1;
	END_IF

	IF Floor2Panel.Key_Down = 1 THEN FLOOR2D:=1;
	END_IF
	
	IF Floor3Panel.Key_Down = 1 THEN FLOOR3D:=1;
	END_IF
	
	IF Floor4Panel.Key_Down = 1 THEN FLOOR4D:=1;
	END_IF
	
	IF Floor5Panel.Key_Down = 1 THEN FLOOR5D:=1;
	END_IF
	
	IF Floor6Panel.Key_Down = 1 THEN FLOOR6D:=1;
	END_IF
	
	IF Floor7Panel.Key_Down = 1 THEN FLOOR7D:=1;
	END_IF
	
	IF FLOOR1D=1 AND KONGR=1 AND RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0 THEN  
		RB1 := 1;
		FLOOR1D := 0;
	END_IF
	IF RB1 = 1 THEN
	
		IF RightCabin.Display_Current_Floor = 1 THEN
		
		
			RightTower.Signal_Start_CabinMotor_P := 0;
			RightTower.Signal_Stop_CabinMotor := 1;
			RightTower.Signal_Start_DoorMotor_P := 1;
			IF RightTower.Sensor_DoorOpened = TRUE THEN
			
				RightTower.Signal_Start_DoorMotor_P := 0;
				RightTower.Signal_Start_DoorMotor_N := 1;
				IF RightTower.Sensor_DoorClosed = TRUE THEN
					RightTower.Signal_Start_DoorMotor_N := 0;
					FLOOR1D := 0;
					RB1 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR1D=1 AND KONGR=1 AND RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0 THEN  
		RB1 := 1;
		FLOOR1D := 0;
	END_IF
	IF RB1 = 1 THEN
		IF RightCabin.Display_Current_Floor >=1 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 1 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					RB1 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR1D=1  AND KONGL=1 AND (RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL1 := 1;
		FLOOR1D :=0;
	END_IF 
	IF RL1 = 1 THEN
		IF LeftCabin.Display_Current_Floor = 1 THEN
			LeftTower.Signal_Start_CabinMotor_P := 0;
			LeftTower.Signal_Stop_CabinMotor := 1;
			LeftTower.Signal_Start_DoorMotor_P := 1;
			IF LeftTower.Sensor_DoorOpened = TRUE THEN
				LeftTower.Signal_Start_DoorMotor_P := 0;
				LeftTower.Signal_Start_DoorMotor_N := 1;
				RL1 := 0;
			END_IF
		END_IF
	END_IF



	IF FLOOR1D=1   AND KONGL=1 AND (RB2=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL1 := 1;
		FLOOR1D :=0;
	END_IF	
	IF RL1 = 1 THEN
		IF LeftCabin.Display_Current_Floor >=1 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 1 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL1 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	
		
	IF FLOOR2D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB2 := 1;
		FLOOR2D := 0;
	END_IF
	IF RB2 = 1 THEN
		IF RightCabin.Display_Current_Floor <=2 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 2 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR2D := 0;
					RB2 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR2D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB2 := 1;
		FLOOR2D := 0;
	END_IF
	IF RB2 = 1 THEN
		IF RightCabin.Display_Current_Floor >=2 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 2 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR2D := 0;
					RB2 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR2D=1  AND KONGL=1 AND (RB1=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN 
		RL2 := 1;
		FLOOR2D := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor <=2 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL2 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR2D=1   AND KONGL=1 AND (RB1=1  OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL2 := 1;
		FLOOR2D := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor >=2 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 2 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL2:= 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR3D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB3 := 1;
		FLOOR3D := 0;
	END_IF
	IF RB3 = 1 THEN
		IF RightCabin.Display_Current_Floor <=3 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 3 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR3D := 0;
					RB3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF



	IF FLOOR3D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB3 := 1;
		FLOOR3D := 0;
	END_IF
	IF RB3 = 1 THEN
		IF RightCabin.Display_Current_Floor >=3 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 3 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR3D := 0;
					RB3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR3D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL3 := 1;
		FLOOR3D := 0;
	END_IF
	IF RL3=1 THEN
		IF LeftCabin.Display_Current_Floor <=3 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR3D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB4=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL3 := 1;
		FLOOR3D := 0;
	END_IF
	IF RL3=1 THEN
		IF LeftCabin.Display_Current_Floor >=3 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL3 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	


	IF FLOOR4D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB4 := 1;
		FLOOR4D := 0;
	END_IF
	IF RB4 = 1 THEN
		IF RightCabin.Display_Current_Floor <=4 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 4 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR4D := 0;
					RB4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR4D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB4 := 1;
		FLOOR4D := 0;
	END_IF
	IF RB4 = 1 THEN
		IF RightCabin.Display_Current_Floor >=4 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 4 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR4D := 0;
					RB4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR4D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN 
		RL4 := 1;
		FLOOR4D := 0;
	END_IF
	IF RL4=1 THEN
		IF LeftCabin.Display_Current_Floor <=4 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR4D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB5=1 OR RB6=1 OR RB7=1) THEN
		RL4 := 4;
		FLOOR4D := 0;
	END_IF
	IF RL4=1 THEN
		IF LeftCabin.Display_Current_Floor >=4 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 4 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL4 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR5D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB5 := 1;
		FLOOR5D := 0;
	END_IF
	IF RB5 = 1 THEN
		IF RightCabin.Display_Current_Floor <=5 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 5 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR5D := 0;
					RB5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR5D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB5 := 1;
		FLOOR5D := 0;
	END_IF
	IF RB5 = 1 THEN
		IF RightCabin.Display_Current_Floor >=5 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 5 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR5D := 0;
					RB5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR5D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB6=1 OR RB7=1) THEN 
		RL5 := 1;
		FLOOR5D := 0;
	END_IF
	IF RL5=1 THEN
		IF LeftCabin.Display_Current_Floor <=5 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR5D=1  AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB6=1 OR RB7=1) THEN
		RL5 := 1;
		FLOOR5D := 0;
	END_IF
	IF RL5=1 THEN
		IF LeftCabin.Display_Current_Floor >=5 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 5 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL5 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR6D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB6 := 1;
		FLOOR6D := 0;
	END_IF
	IF RB6 = 1 THEN
		IF RightCabin.Display_Current_Floor <=6 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 6 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR6D := 0;
					RB6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR6D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB6 := 1;
		FLOOR6D := 0;
	END_IF
	IF RB6 = 1 THEN
		IF RightCabin.Display_Current_Floor >=6 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 6 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR6D := 0;
					RB6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR6D=1  AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB7=1) THEN
		RL6 := 1;
		FLOOR6D := 0;
	END_IF
	IF RL2=1 THEN
		IF LeftCabin.Display_Current_Floor <=6 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR6D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB7=1) THEN
		RL6 := 1;
		FLOOR6D := 0;
	END_IF
	IF RL6=1 THEN
		IF LeftCabin.Display_Current_Floor >=6 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 6 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL6 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
	IF FLOOR7D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB7 := 1;
		FLOOR7D := 0;
	END_IF
	IF RB7 = 1 THEN
		IF RightCabin.Display_Current_Floor <=7 THEN
			RightTower.Signal_Start_CabinMotor_P := 1;
			IF RightCabin.Display_Current_Floor = 7 THEN
				RightTower.Signal_Start_CabinMotor_P := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR7D := 0;
					RB7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR7D=1 AND KONGR=1 AND (RB1=0 AND RB2=0 AND RB3=0 AND RB4=0 AND RB5=0 AND RB6=0 AND RB7=0) THEN  
		RB7 := 1;
		FLOOR7D := 0;
	END_IF
	IF RB7 = 1 THEN
		IF RightCabin.Display_Current_Floor >=7 THEN
			RightTower.Signal_Start_CabinMotor_N := 1;
			IF RightCabin.Display_Current_Floor = 7 THEN
				RightTower.Signal_Start_CabinMotor_N := 0;
				RightTower.Signal_Stop_CabinMotor := 1;
				RightTower.Signal_Start_DoorMotor_P := 1;
				IF RightTower.Sensor_DoorOpened = TRUE THEN
					RightTower.Signal_Start_DoorMotor_P := 0;
					RightTower.Signal_Start_DoorMotor_N := 1;
					FLOOR7D := 0;
					RB7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF

	IF FLOOR7D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1) THEN
		RL7 := 1;
		FLOOR7D := 0;
	END_IF
	IF RL7=1 THEN
		IF LeftCabin.Display_Current_Floor <=7 THEN
			LeftTower.Signal_Start_CabinMotor_P := 1;
			IF LeftCabin.Display_Current_Floor = 7 THEN
				LeftTower.Signal_Start_CabinMotor_P := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF


	IF FLOOR7D=1   AND KONGL=1 AND (RB1=1  OR RB2=1 OR RB3=1 OR RB4=1 OR RB5=1 OR RB6=1) THEN
		RL7 := 1;
		FLOOR7D := 0;
	END_IF
	IF RL7=1 THEN
		IF LeftCabin.Display_Current_Floor >=3 THEN
			LeftTower.Signal_Start_CabinMotor_N := 1;
			IF LeftCabin.Display_Current_Floor = 3 THEN
				LeftTower.Signal_Start_CabinMotor_N := 0;
				LeftTower.Signal_Stop_CabinMotor := 1;
				LeftTower.Signal_Start_DoorMotor_P := 1;
				IF LeftTower.Sensor_DoorOpened = TRUE THEN
					LeftTower.Signal_Start_DoorMotor_P := 0;
					LeftTower.Signal_Start_DoorMotor_N := 1;
					RL7 := 0;
				END_IF
			END_IF
		END_IF
	END_IF
	
END_PROGRAM
