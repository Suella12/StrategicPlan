table 80208 "Strategies Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategic Actions Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategic Actions Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Strategy Code"; code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Strategy Code";
        }
    }

    keys
    {
        key(Key1; "Strategic Actions Code", "Strategy Code")
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