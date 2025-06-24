table 80209 "Strategic Actions Header"
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
        field(3; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Strategy Code";
            //this trigger enters the other values automatically from the Strategies Header table when the Strategy Code is entered. 
            trigger OnValidate()
            var
                objHeader: Record "Strategies Header";
            begin
                if objHeader.Get("Strategy Code") then begin
                    "Strategy Description" := objHeader."Strategy Description";
                    "Output Code" := objHeader."Output Code";
                    "Output Description" := objHeader."Output Description";
                    "Strategic Objective Code" := objHeader."Strategic Objective Code";
                    "Strategic Objective" := ObjHeader."Strategic Objective";
                    "Pillar Code" := ObjHeader."Pillar Code";
                    "Pillar Description" := ObjHeader."Pillar Description";
                    "Outcome Code" := ObjHeader."Outcome Code";
                    "Outcome Description" := ObjHeader."Outcome Description";

                end else begin
                    Clear("Strategy Description");
                    Clear("Output Code");
                    Clear("Output Description");
                    Clear("Strategic Objective");
                    Clear("Pillar Code");
                    Clear("Pillar Description");
                    Clear("Outcome Description");
                    Clear("Outcome Code");


                end;
            end;
        }
        field(4; "Strategy Description"; text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Strategy Description";
        }
        field(5; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategies Header"."Output Code";

        }
        field(6; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            tablerelation = "Strategies Header"."Output Description";
            Editable = false;
        }
        field(7; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategies Header"."Outcome Code";
        }
        field(8; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Strategies Header"."Outcome Description";

        }
        field(9; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Strategies Header"."Strategic Objective Code";

        }
        field(10; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Strategies Header"."Strategic Objective";

        }
        field(11; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Strategies Header"."Pillar Code";


        }
        field(12; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Strategies Header"."Pillar Description";

        }

    }



    keys
    {
        key(Key1; "Strategic Actions Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Strategic Actions Code", "Strategic Actions Description") { }
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