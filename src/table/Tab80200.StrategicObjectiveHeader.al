table 80200 "Strategic Objective Header"
{
    Caption = 'Strategic Objective';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            NotBlank = true;

        }
        field(2; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            NotBlank = true;
        }
        field(3; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            TableRelation = "Pillars Table"."Pillar Code";
            NotBlank = true;
        }
        field(4; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            TableRelation = "Pillars Table"."Pillar Description";
            NotBlank = true;
        }

    }
    keys
    {
        key(PK; "Strategic Objective Code")
        {
            Clustered = true;
        }
    }
}
