table 80208 "Strategies Subform"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Strategic Actions Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            editable = false;
        }
        field(2; "Strategic Actions Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var

                Strategy: Record "Strategies Header";
                Action: Record "Strategic Actions Header";
                ActionRec: Record "Strategies Subform";
                MaxSuffix: Integer;
                CodeParts: List of [Text];
                CurrentCode: Text;
                SuffixText: Text;

            begin
                if ("Strategic Actions Code" = '') and ("Strategy Code" <> '') then begin
                    MaxSuffix := 0;

                    ActionRec.SetRange("Strategy Code", "Strategy Code");
                    if ActionRec.FindSet() then begin
                        repeat
                            CurrentCode := ActionRec."Strategic Actions Code";
                            if StrPos(CurrentCode, '.') > 0 then begin
                                CodeParts := CurrentCode.Split('.');
                                if CodeParts.Count = 5 then begin
                                    SuffixText := CodeParts.Get(5);
                                    if Evaluate(MaxSuffix, SuffixText) then;
                                end;
                            end;
                        until ActionRec.Next() = 0;
                    end;
                    MaxSuffix += 1;
                    "Strategic Actions Code" := "Strategy Code" + '.' + Format(MaxSuffix);
                end;



                if Strategy.Get("Strategy Code") then begin
                    // Strategy exists — so update existing action
                    if Action.Get("Strategic Actions Code") then begin
                        Action."Strategic Actions Description" := "Strategic Actions Description";
                        Action.Modify();
                    end else begin
                        Action.Init();
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
                        Action.Insert();
                    end;
                end else begin
                    // Strategy does not exist — show a helpful error
                    Error('The Strategy with code %1 does not exist.', "Strategy Code");
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

    // trigger OnModify()
    // begin

    // end;
    trigger OnModify()
    var
        OldStrategy: Record "Strategies Header";
        NewStrategy: Record "Strategies Header";
        Action: Record "Strategic Actions Header";
    begin
        // Step 1: If the Strategy Code has changed, remove link from old strategy
        if xRec."Strategy Code" <> "Strategy Code" then begin
            if OldStrategy.Get(xRec."Strategy Code") then begin
                // Optional logic: e.g., log, cleanup, etc.
            end;
        end;

        // Step 2: If Strategic Actions Code exists in the header, update description
        if Action.Get("Strategic Actions Code") then begin
            Action."Strategic Actions Description" := "Strategic Actions Description";
            Action.Modify();
        end;

        // Step 3: If Strategic Actions Code does not exist, create a new record
        if not Action.Get("Strategic Actions Code") then begin
            if NewStrategy.Get("Strategy Code") then begin
                Action.Init();
                Action."Strategic Actions Code" := "Strategic Actions Code";
                Action."Strategic Actions Description" := "Strategic Actions Description";
                Action."Strategy Code" := "Strategy Code";
                Action."Strategy Description" := NewStrategy."Strategy Description";
                Action."Output Code" := NewStrategy."Output Code";
                Action."Output Description" := NewStrategy."Output Description";
                Action."Outcome Code" := NewStrategy."Outcome Code";
                Action."Outcome Description" := NewStrategy."Outcome Description";
                Action."Pillar Code" := NewStrategy."Pillar Code";
                Action."Pillar Description" := NewStrategy."Pillar Description";
                Action."Strategic Objective Code" := NewStrategy."Strategic Objective Code";
                Action."Strategic Objective" := NewStrategy."Strategic Objective";
                Action.Insert();
            end;
        end;
    end;


    trigger OnDelete()
    var
        Action: Record "Strategic Actions Header";
    begin
        if Action.Get("Strategic Actions Code") then
            Action.Delete();
    end;


    trigger OnRename()
    begin

    end;

}