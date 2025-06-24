table 80206 "Output Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(2; "Strategy Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Output: Record "Output Header";
                Strategy: Record "Strategies Header";
                StrategyRec: Record "Output Subform";
                MaxSuffix: Integer;
                CodeParts: List of [Text];
                CurrentCode: Text;
                SuffixText: Text;

            begin
                if ("Strategy Code" = '') and ("Output Code" <> '') then begin
                    MaxSuffix := 0;

                    StrategyRec.SetRange("Output Code", "Output Code");
                    if StrategyRec.FindSet() then begin
                        repeat
                            CurrentCode := StrategyRec."Strategy Code";
                            if StrPos(CurrentCode, '.') > 0 then begin
                                CodeParts := CurrentCode.Split('.');
                                if CodeParts.Count = 4 then begin
                                    SuffixText := CodeParts.Get(4);
                                    if Evaluate(MaxSuffix, SuffixText) then;
                                end;
                            end;
                        until StrategyRec.Next() = 0;

                    end;
                    MaxSuffix += 1;
                    "Strategy Code" := "Output Code" + '.' + Format(MaxSuffix);
                end;

                if Output.Get("Output Code") then begin
                    if Strategy.Get("Strategy Code") then begin
                        // Modify existing strategy
                        Strategy."Strategy Description" := "Strategy Description";
                        Strategy.Modify();
                    end else begin
                        // Insert new strategy
                        Strategy.Init();
                        Strategy."Strategy Code" := "Strategy Code";
                        Strategy."Strategy Description" := "Strategy Description";
                        Strategy."Output Code" := "Output Code";
                        Strategy."Output Description" := Output."Output Description";
                        Strategy."Outcome Code" := Output."Outcome Code";
                        Strategy."Outcome Description" := Output."Outcome Description";
                        Strategy."Pillar Code" := Output."Pillar Code";
                        Strategy."Pillar Description" := Output."Pillar Description";
                        Strategy."Strategic Objective Code" := Output."Strategic Objective Code";
                        Strategy."Strategic Objective" := Output."Strategic Objective";
                        Strategy.Insert();
                    end;
                end;
            end;


        }
        field(3; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Output Header"."Output Code" where("Output Code" = field("Output Code"));

        }
    }

    keys
    {
        key(Key1; "Strategy Code", "Output Code")
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
        OldStrategy: Record "Strategies Header";
        NewStrategy: Record "Strategies Header";
        Output: Record "Output Header";
    begin
        // Step 1: If the Strategy Code has changed, delete the old strategy
        if xRec."Strategy Code" <> "Strategy Code" then begin
            if OldStrategy.Get(xRec."Strategy Code") then
                OldStrategy.Delete();
        end;

        // Step 2: Insert or update the Strategies Header record
        if Output.Get("Output Code") then begin
            if NewStrategy.Get("Strategy Code") then begin
                // Modify existing record
                NewStrategy."Strategy Description" := "Strategy Description";
                NewStrategy."Output Code" := "Output Code";
                NewStrategy."Output Description" := Output."Output Description";
                NewStrategy."Outcome Code" := Output."Outcome Code";
                NewStrategy."Outcome Description" := Output."Outcome Description";
                NewStrategy."Pillar Code" := Output."Pillar Code";
                NewStrategy."Pillar Description" := Output."Pillar Description";
                NewStrategy."Strategic Objective Code" := Output."Strategic Objective Code";
                NewStrategy."Strategic Objective" := Output."Strategic Objective";
                NewStrategy.Modify();
            end else begin
                // Insert new record
                NewStrategy.Init();
                NewStrategy."Strategy Code" := "Strategy Code";
                NewStrategy."Strategy Description" := "Strategy Description";
                NewStrategy."Output Code" := "Output Code";
                NewStrategy."Output Description" := Output."Output Description";
                NewStrategy."Outcome Code" := Output."Outcome Code";
                NewStrategy."Outcome Description" := Output."Outcome Description";
                NewStrategy."Pillar Code" := Output."Pillar Code";
                NewStrategy."Pillar Description" := Output."Pillar Description";
                NewStrategy."Strategic Objective Code" := Output."Strategic Objective Code";
                NewStrategy."Strategic Objective" := Output."Strategic Objective";
                NewStrategy.Insert();
            end;
        end;
    end;


    trigger OnDelete()

    var
        Strategy: Record "Strategies Header";
    begin
        if Strategy.Get("Strategy Code") then
            Strategy.Delete();
    end;

    trigger OnRename()
    begin

    end;

}