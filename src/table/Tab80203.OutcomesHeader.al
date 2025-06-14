table 80203 "Outcomes Header"
{
    Caption = 'Outcomes Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(2; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;

        }
        field(3; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Strategic Objective Header"."Strategic Objective Code";
            trigger OnValidate()
            var
                ObjHeader: Record "Strategic Objective Header";
            begin
                if ObjHeader.Get("Strategic Objective Code") then begin
                    "Strategic Objective" := ObjHeader."Strategic Objective";
                    "Pillar Code" := ObjHeader."Pillar Code";
                    "Pillar Description" := ObjHeader."Pillar Description";
                end else begin
                    Clear("Strategic Objective");
                    Clear("Pillar Code");
                    Clear("Pillar Description");
                end;
            end;


        }
        field(4; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Strategic Objective Header"."Strategic Objective";

        }
        field(5; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Strategic Objective Header"."Pillar Code";


        }
        field(6; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Strategic Objective Header"."Pillar Description";

        }

    }

    keys
    {
        key(Key1; "Outcome Code")
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