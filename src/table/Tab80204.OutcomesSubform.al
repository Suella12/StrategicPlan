table 80204 "Outcomes Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            editable = false;

        }
        field(2; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            //Code to enter values automatically into the Outputs Header table. 
            trigger onvalidate()
            var
                Outcome: Record "Outcomes Header";
                Output: Record "Output Header";
                OutputRec: Record "Outcomes Subform";
                MaxSuffix: Integer;
                CodeParts: List of [Text];
                CurrentCode: Text;
                SuffixText: Text;
            begin
                if ("Output Code" = '') and ("Outcome Code" <> '') then begin
                    MaxSuffix := 0;

                    OutputRec.SetRange("Outcome Code", "Outcome Code");
                    if OutputRec.FindSet() then begin
                        repeat
                            CurrentCode := OutputRec."Output Code";
                            if StrPos(CurrentCode, '.') > 0 then begin
                                CodeParts := CurrentCode.Split('.');
                                if CodeParts.Count = 3 then begin
                                    SuffixText := CodeParts.Get(3);
                                    if Evaluate(MaxSuffix, SuffixText) then;
                                end;
                            end;
                        until OutputRec.Next() = 0;
                    end;
                    MaxSuffix += 1;
                    "Output Code" := "Outcome Code" + '.' + Format(MaxSuffix);
                end;

                if Outcome.Get("Outcome Code") then begin
                    if Output.Get("Output Code") then begin
                        Output."Output Description" := "Output Description";
                        Output.Modify();
                    end else begin
                        Output.Init();
                        Output."Output Code" := "Output Code";
                        Output."Output Description" := "Output Description";
                        Output."Outcome Code" := "Outcome Code";
                        Output."Outcome Description" := Outcome."Outcome Description";
                        Output."Pillar Code" := Outcome."Pillar Code";
                        Output."Pillar Description" := Outcome."Pillar Description";
                        Output."Strategic Objective Code" := Outcome."Strategic Objective Code";
                        output."Strategic Objective" := Outcome."Strategic Objective";
                        output.insert();
                    end;
                end;
            end;
        }
        field(3; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Outcomes Header"."Outcome Code" where("Outcome Code" = field("Outcome Code"));
        }
        field(4; "Added Number"; code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Output Code", "Outcome Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    var
        OldOutput: Record "Output Header";
        NewOutput: Record "Output Header";
        Outcome: Record "Outcomes Header";
    begin
        // Step 1: If the Output Code was changed, delete the old one
        if xRec."Output Code" <> "Output Code" then begin
            if OldOutput.Get(xRec."Output Code") then
                OldOutput.Delete();
        end;

        // Step 2: Insert or update the Output Header record
        if Outcome.Get("Outcome Code") then begin
            if NewOutput.Get("Output Code") then begin
                // Modify existing record
                NewOutput."Output Description" := "Output Description";
                NewOutput."Outcome Code" := "Outcome Code";
                NewOutput."Outcome Description" := Outcome."Outcome Description";
                NewOutput."Pillar Code" := Outcome."Pillar Code";
                NewOutput."Pillar Description" := Outcome."Pillar Description";
                NewOutput."Strategic Objective Code" := Outcome."Strategic Objective Code";
                NewOutput."Strategic Objective" := Outcome."Strategic Objective";
                NewOutput.Modify();
            end else begin
                // Insert new record
                NewOutput.Init();
                NewOutput."Output Code" := "Output Code";
                NewOutput."Output Description" := "Output Description";
                NewOutput."Outcome Code" := "Outcome Code";
                NewOutput."Outcome Description" := Outcome."Outcome Description";
                NewOutput."Pillar Code" := Outcome."Pillar Code";
                NewOutput."Pillar Description" := Outcome."Pillar Description";
                NewOutput."Strategic Objective Code" := Outcome."Strategic Objective Code";
                NewOutput."Strategic Objective" := Outcome."Strategic Objective";
                NewOutput.Insert();
            end;
        end;
    end;


    trigger OnDelete()
    var
        Output: Record "Output Header";
    begin
        if Output.Get("Output Code") then
            Output.Delete();
    end;

    trigger OnRename()
    begin

    end;

}