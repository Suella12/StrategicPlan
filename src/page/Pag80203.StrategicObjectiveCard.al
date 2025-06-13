page 80203 "Strategic Objective Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategic Objective Header";


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';
                    trigger OnValidate()
                    var
                        PillarRec: Record "Pillars Table";
                    begin
                        if PillarRec.Get(Rec."Pillar Code") then
                            Rec."Pillar Description" := PillarRec."Pillar Description"
                        else
                            Rec."Pillar Description" := '';
                    end;
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                    Editable = false;
                }
                field("Code"; Rec."Strategic Objective Code")
                {

                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }

            }

            part(Lines; "Strategic Objectives Lines")
            {
                ApplicationArea = All;
                Caption = 'Outcomes';
                SubPageLink = "StrategicObjectiveCode" = field("Strategic Objective Code");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {

            //     trigger OnAction()
            //     begin

            //     end;
            // }
            action(OpenOutcomesList)
            {
                ApplicationArea = All;
                Caption = 'Go to Outcomes list';
                Image = List;
                Promoted = true;
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Outcomes List");
                end;
            }
        }
    }

    var
        myInt: Integer;
}