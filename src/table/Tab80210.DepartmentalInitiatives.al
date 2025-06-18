table 80210 "Departmental Initiatives"
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
        field(4; "Strategic Actions Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Actions Header"."Strategic Actions Code";
            ToolTip = 'Specifies the value of the Strategic Actions Code field.';
            trigger OnValidate()
            var
                SAHeader: Record "Strategic Actions Header";
                DeptInitiatives: Record "Departmental Initiatives";
            begin
                if SAHeader.Get("Strategic Actions Code") then begin
                    Rec."Strategic Actions Description" := SAHeader."Strategic Actions Description";
                    Rec."Strategy Code" := SAHeader."Strategy Code";
                    Rec."Strategy Description" := SAHeader."Strategy Description";
                    Rec."Output Code" := SAHeader."Output Code";
                    Rec."Output Description" := SAHeader."Output Description";
                    Rec."Outcome Code" := SAHeader."Outcome Code";
                    Rec."Outcome Description" := SAHeader."Outcome Description";
                    Rec."Strategic Objective Code" := SAHeader."Strategic Objective Code";
                    Rec."Strategic Objective" := SAHeader."Strategic Objective";
                    Rec."Pillar Code" := SAHeader."Pillar Code";
                    Rec."Pillar Description" := SAHeader."Pillar Description";

                end;
            end;
        }
        field(5; "Strategic Actions Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Actions Header"."Strategic Actions Description";
            Editable = False;

        }
        field(6; "Strategy Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategic Actions Header"."Strategy Code";
            //this trigger enters the other values automatically from the Strategies Header table when the Strategy Code is entered. 
            // trigger OnValidate()
            // var
            //     objHeader: Record "Strategies Header";
            // begin
            //     if objHeader.Get("Strategy Code") then begin
            //         "Strategy Description" := objHeader."Strategy Description";
            //         "Output Code" := objHeader."Output Code";
            //         "Output Description" := objHeader."Output Description";
            //         "Strategic Objective Code" := objHeader."Strategic Objective Code";
            //         "Strategic Objective" := ObjHeader."Strategic Objective";
            //         "Pillar Code" := ObjHeader."Pillar Code";
            //         "Pillar Description" := ObjHeader."Pillar Description";
            //         "Outcome Code" := ObjHeader."Outcome Code";
            //         "Outcome Description" := ObjHeader."Outcome Description";

            //     end else begin
            //         Clear("Strategy Description");
            //         Clear("Output Code");
            //         Clear("Output Description");
            //         Clear("Strategic Objective");
            //         Clear("Pillar Code");
            //         Clear("Pillar Description");
            //         Clear("Outcome Description");
            //         Clear("Outcome Code");


            //     end;
            // end;
        }
        field(7; "Strategy Description"; text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategic Actions Header"."Strategy Description";
        }
        field(8; "Output Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Actions Header"."Output Code";

        }
        field(9; "Output Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            tablerelation = "Strategic Actions Header"."Output Description";
            Editable = false;
        }
        field(10; "Outcome Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Strategic Actions Header"."Outcome Code";
        }
        field(11; "Outcome Description"; text[250])
        {
            DataClassification = ToBeClassified;
            editable = false;
            TableRelation = "Strategic Actions Header"."Outcome Description";

        }
        field(12; "Strategic Objective Code"; Code[10])
        {
            Caption = 'Strategic Objective Code';
            editable = false;
            TableRelation = "Strategic Actions Header"."Strategic Objective Code";

        }
        field(13; "Strategic Objective"; Text[250])
        {
            Caption = 'Strategic Objective';
            editable = false;
            TableRelation = "Strategic Actions Header"."Strategic Objective";

        }
        field(14; "Pillar Code"; Code[10])
        {
            Caption = 'Pillar';
            editable = false;
            TableRelation = "Strategic Actions Header"."Pillar Code";


        }
        field(15; "Pillar Description"; Text[250])
        {
            Caption = 'Pillar Description';
            Editable = false;
            TableRelation = "Strategic Actions Header"."Pillar Description";

        }
        field(16; "Department Code"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENTS'));
        }
        field(17; Year; Integer)
        {
            DataClassification = ToBeClassified;
        }




    }

    keys
    {
        key(Key1; Code)
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