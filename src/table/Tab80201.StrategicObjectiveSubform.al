table 80201 "Strategic Objective Subform"
{
    Caption = 'Strategic Objective Subform';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "StrategicObjectiveCode"; Code[20])
        {
            Caption = 'Strategic Objective Code';
            TableRelation = "Strategic Objective Header"."Strategic Objective Code" where("Strategic Objective Code" = field(StrategicObjectiveCode));

        }
        field(2; "Outcome Code"; Code[10])
        {
            Caption = 'Outcome Code';
            editable = false;

        }
        field(4; "Outcome Description"; Text[250])
        {
            Caption = 'Outcome Description';

            trigger OnValidate()
            var
                Header: Record "Strategic Objective Header";
                Outcome: Record "Outcomes Header";
                OutcomeRec: Record "Strategic Objective Subform";
                MaxSuffix: Integer;
                CodeParts: List of [Text];
                CurrentCode: Text;
                SuffixText: Text;
            begin
                // 1. Generate Outcome Code based on Strategic Objective Code, only if blank
                if (("Outcome Code" = '') and ("StrategicObjectiveCode" <> '')) then begin
                    MaxSuffix := 0;

                    OutcomeRec.SetRange("StrategicObjectiveCode", "StrategicObjectiveCode");
                    if OutcomeRec.FindSet() then begin
                        repeat
                            CurrentCode := OutcomeRec."Outcome Code";
                            if StrPos(CurrentCode, '.') > 0 then begin
                                CodeParts := CurrentCode.Split('.');
                                if CodeParts.Count = 2 then begin
                                    SuffixText := CodeParts.Get(2);
                                    if Evaluate(MaxSuffix, SuffixText) then;
                                end;
                            end;
                        until OutcomeRec.Next() = 0;
                    end;

                    MaxSuffix += 1;
                    "Outcome Code" := "StrategicObjectiveCode" + '.' + Format(MaxSuffix);
                end;

                // 2. Insert or update record in Outcomes Header table
                if Header.Get("StrategicObjectiveCode") then begin
                    if Outcome.Get("Outcome Code") then begin
                        // Record exists — update it
                        Outcome."Outcome Description" := "Outcome Description";
                        Outcome.Modify();
                    end else begin
                        // Record doesn't exist — insert it
                        Outcome.Init();
                        Outcome."Outcome Code" := "Outcome Code";
                        Outcome."Outcome Description" := "Outcome Description";
                        Outcome."Strategic Objective Code" := "StrategicObjectiveCode";
                        Outcome."Strategic Objective" := Header."Strategic Objective";
                        Outcome."Pillar Code" := Header."Pillar Code";
                        Outcome."Pillar Description" := Header."Pillar Description";
                        Outcome.Insert();
                    end;
                end;
            end;

        }


    }
    keys
    {
        key(PK; "StrategicObjectiveCode", "Outcome Code")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        Outcome: Record "Outcomes Header";
    begin
        if Outcome.Get("Outcome Code") then
            Outcome.Delete();
    end;

    trigger OnModify()
    var
        OldOutcome: Record "Outcomes Header";
        NewOutcome: Record "Outcomes Header";
        Header: Record "Strategic Objective Header";
    begin
        // ✅ Step 1: If the Outcome Code was changed, delete the old one
        if xRec."Outcome Code" <> "Outcome Code" then begin
            if OldOutcome.Get(xRec."Outcome Code") then
                OldOutcome.Delete();
        end;

        // ✅ Step 2: Insert or update the outcome based on the current Outcome Code
        if Header.Get("StrategicObjectiveCode") then begin
            if NewOutcome.Get("Outcome Code") then begin
                // Record exists → modify
                NewOutcome."Outcome Description" := "Outcome Description";
                NewOutcome."Strategic Objective Code" := "StrategicObjectiveCode";
                NewOutcome."Strategic Objective" := Header."Strategic Objective";
                NewOutcome."Pillar Code" := Header."Pillar Code";
                NewOutcome."Pillar Description" := Header."Pillar Description";
                NewOutcome.Modify();
            end else begin
                // Record doesn't exist → insert new one
                NewOutcome.Init();
                NewOutcome."Outcome Code" := "Outcome Code";
                NewOutcome."Outcome Description" := "Outcome Description";
                NewOutcome."Strategic Objective Code" := "StrategicObjectiveCode";
                NewOutcome."Strategic Objective" := Header."Strategic Objective";
                NewOutcome."Pillar Code" := Header."Pillar Code";
                NewOutcome."Pillar Description" := Header."Pillar Description";
                NewOutcome.Insert();
            end;
        end;
    end;
}
