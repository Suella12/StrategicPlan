table 80214 "Activity Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Department; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Department Initiative Code"; Code[15])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Department Initiative"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Strategic Action"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Strategy"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Output; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Outcome; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Strategic Objective"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Pillar; Text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
        }

    }

    keys
    {
        key(Key1; Department, "Department Initiative Code")
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