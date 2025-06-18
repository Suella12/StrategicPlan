table 80212 "Consolidated Dept Initiatives"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Department; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));

        }
        field(4; "Dept Initiative code"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Dept Initiative"; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Strategic Actions Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Strategic Actions Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Actions Header"."Strategic Actions Description";

        }
        field(8; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Strategy Description"; text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Strategy Description";
        }
        field(10; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategies Header"."Output Code";

        }
        field(11; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            tablerelation = "Strategies Header"."Output Description";
            Editable = false;
        }
        field(12; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Outcome Code";
        }
        field(13; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Strategies Header"."Outcome Description";

        }
        field(14; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Strategies Header"."Strategic Objective Code";

        }
        field(15; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Strategies Header"."Strategic Objective";

        }
        field(16; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Strategies Header"."Pillar Code";


        }
        field(17; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Strategies Header"."Pillar Description";

        }



    }

    keys
    {
        key(Key1; "Dept Initiative code")
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