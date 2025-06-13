table 80206 "Output Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Strategy Description"; Text[250])
        {
            DataClassification = ToBeClassified;

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
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}