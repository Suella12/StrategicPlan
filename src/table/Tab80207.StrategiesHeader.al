table 80207 "Strategies Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategy Description"; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Output Header"."Output Code";
            trigger OnValidate()
            var
                objHeader: Record "Output Header";
            begin
                if ObjHeader.Get("Output Code") then begin
                    "Output Description" := objHeader."Output Description";
                    "Strategic Objective Code" := objHeader."Strategic Objective Code";
                    "Strategic Objective" := ObjHeader."Strategic Objective";
                    "Pillar Code" := ObjHeader."Pillar Code";
                    "Pillar Description" := ObjHeader."Pillar Description";
                    "Outcome Code" := ObjHeader."Outcome Code";
                    "Outcome Description" := ObjHeader."Outcome Description";

                end else begin
                    Clear("Output Description");
                    Clear("Strategic Objective");
                    Clear("Pillar Code");
                    Clear("Pillar Description");
                    Clear("Outcome Description");
                    Clear("Outcome Code");

                end;


            end;

        }
        field(4; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            tablerelation = "Output Header"."Output Description";

        }
        field(5; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Output Header"."Outcome Code";
        }
        field(6; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Output Header"."Outcome Description";

        }
        field(7; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Output Header"."Strategic Objective Code";

        }
        field(8; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Output Header"."Strategic Objective";

        }
        field(9; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Output Header"."Pillar Code";


        }
        field(10; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Output Header"."Pillar Description";

        }



    }

    keys
    {
        key(Key1; "Strategy Code")
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