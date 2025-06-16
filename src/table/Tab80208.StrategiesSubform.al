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
            trigger OnValidate()
            var

                Strategy: Record "Strategies Header";
                Action: Record "Strategic Actions Header";
            begin
                if Strategy.Get("Strategy Code") then begin
                    Action.init();
                    Action."Strategic Actions Code" := "Strategic Actions Code";
                    Action."Strategic Actions Description" := "Strategic Actions Description";
                    Action."Strategy Code" := "Strategy Code";
                    Action."Strategy Description" := Strategy."Strategy Description";
                    Action."Output Code" := Strategy."Output Code";
                    Action."Output Description" := Strategy."Output Description";
                    Action."Outcome Code" := Strategy."Outcome Code";
                    Action."Outcome Description" := Strategy."Outcome Description";
                    Action."Pillar Code" := Strategy."Pillar Code";
                    Action."Pillar Description" := Strategy."Pillar Description";
                    Action."Strategic Objective Code" := Strategy."Strategic Objective Code";
                    Action."Strategic Objective" := Strategy."Strategic Objective";
                    Action.insert(true);
                end;
            end;


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