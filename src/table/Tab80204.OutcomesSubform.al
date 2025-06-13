table 80204 "Outcomes Subform"
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
            editable = false;
            TableRelation = "Outcomes Header"."Outcome Code" where("Outcome Code" = field("Outcome Code"));
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
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}