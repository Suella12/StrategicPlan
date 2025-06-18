table 80211 "DeptInitiatives Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Dept Initiative Code"; code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Dept Initiative"; text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Depi: Record "Departmental Initiatives";
                Depil: Record "Consolidated Dept Initiatives";
            begin
                if Depi.Get(Code) then begin
                    Depil.init();
                    Depil."Dept Initiative" := "Dept Initiative";
                    Depil."Dept Initiative code" := "Dept Initiative Code";
                    Depil.Code := Code;
                    Depil."Strategic Actions Code" := Depi."Strategic Actions Code";
                    Depil."Strategic Actions Description" := Depi."Strategic Actions Description";
                    Depil."Strategy Code" := Depi."Strategy Code";
                    Depil."Strategy Description" := Depi."Strategy Description";
                    Depil."Output Code" := Depi."Output Code";
                    Depil."Output Description" := Depi."Output Description";
                    Depil."Outcome Code" := Depi."Outcome Code";
                    Depil."Outcome Description" := Depi."Outcome Description";
                    Depil."Pillar Code" := Depi."Pillar Code";
                    Depil."Pillar Description" := Depi."Pillar Description";
                    Depil."Strategic Objective Code" := Depi."Strategic Objective Code";
                    Depil."Strategic Objective" := Depi."Strategic Objective";
                    Depil.insert(true);

                end;
            end;

        }
        field(3; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Departmental Initiatives".Code;
        }
    }

    keys
    {
        key(Key1; "Dept Initiative Code", Code)
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