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
            //Code to enter values automatically into the Outputs Header table. 
            trigger onvalidate()
            var
                Outcome: Record "Outcomes Header";
                Output: Record "Output Header";

            begin
                if Outcome.Get("Outcome Code") then begin
                    Output.Init();
                    Output."Output Code" := "Output Code";
                    Output."Output Description" := "Output Description";
                    Output."Outcome Code" := "Outcome Code";
                    Output."Outcome Description" := Outcome."Outcome Description";
                    Output."Pillar Code" := Outcome."Pillar Code";
                    Output."Pillar Description" := Outcome."Pillar Description";
                    Output."Strategic Objective Code" := Outcome."Strategic Objective Code";
                    output."Strategic Objective" := Outcome."Strategic Objective";
                    output.insert(true);
                end;
            end;
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