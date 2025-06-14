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
            TableRelation = "Outcomes Header"."Outcome Code";
            trigger OnValidate()
            var
                ObjHeader: Record "Outcomes Header";
            begin
                if ObjHeader.Get("Outcome Code") then begin
                    "Strategic Objective" := ObjHeader."Strategic Objective";
                    "Pillar Code" := ObjHeader."Pillar Code";
                    "Pillar Description" := ObjHeader."Pillar Description";
                    "Outcome Code" := ObjHeader."Outcome Code";
                    "Outcome Description" := ObjHeader."Outcome Description";

                end else begin
                    Clear("Strategic Objective");
                    Clear("Pillar Code");
                    Clear("Pillar Description");
                    Clear("Outcome Description");
                    Clear("Outcome Code");
                end;
            end;

        }
        field(4; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Outcomes Header"."Outcome Description";

        }
        field(5; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Outcomes Header"."Strategic Objective Code";

        }
        field(6; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Outcomes Header"."Strategic Objective";

        }
        field(7; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Outcomes Header"."Pillar Code";


        }
        field(8; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Outcomes Header"."Pillar Description";

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