table 80205 "Output Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;

        }
        field(5; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;

        }
        field(6; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Strategic Objective Header"."Strategic Objective";

        }
        field(7; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Strategic Objective Header"."Pillar Code";


        }
        field(8; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Strategic Objective Header"."Pillar Description";

        }
    }

    keys
    {
        key(Key1; "Output Code")
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
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}