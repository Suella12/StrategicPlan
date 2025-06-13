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

        }
        field(4; "Outcome Description"; Text[250])
        {
            Caption = 'Outcome Description';
            trigger OnValidate()
            var
                Header: Record "Strategic Objective Header";
                Outcome: Record "Outcomes Header";
            begin
                if Header.Get("StrategicObjectiveCode") then begin
                    Outcome.Init();
                    Outcome."Outcome Code" := "Outcome Code";
                    Outcome."Outcome Description" := "Outcome Description";
                    Outcome."Strategic Objective Code" := "StrategicObjectiveCode";
                    Outcome."Strategic Objective" := Header."Strategic Objective";
                    Outcome."Pillar Code" := Header."Pillar Code";
                    Outcome."Pillar Description" := Header."Pillar Description";
                    Outcome.Insert(true);
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


}
