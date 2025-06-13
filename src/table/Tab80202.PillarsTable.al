table 80202 "Pillars Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Pillar Code"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Pillar Description"; Text[250])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Pillar Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; "Pillar Code", "Pillar Description") { }
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