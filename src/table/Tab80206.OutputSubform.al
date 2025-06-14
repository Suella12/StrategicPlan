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
            trigger onvalidate()
            var
                Output: Record "Output Header";
                Strategy: Record "Strategies Header";

            begin
                if Output.Get("Output Code") then begin
                    Strategy.init();
                    Strategy."Strategy Code" := "Strategy Code";
                    Strategy."Strategy Description" := "Strategy Description";
                    Strategy."Output Code" := "Output Code";
                    Strategy."Output Description" := Output."Output Description";
                    strategy."Outcome Code" := output."Outcome Code";
                    Strategy."Outcome Description" := Output."Outcome Description";
                    Strategy."Pillar Code" := Output."Pillar Code";
                    Strategy."Pillar Description" := Output."Pillar Description";
                    Strategy."Strategic Objective Code" := Output."Strategic Objective Code";
                    strategy."Strategic Objective" := Output."Strategic Objective";
                    Strategy.insert(true);
                end;
            end;


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