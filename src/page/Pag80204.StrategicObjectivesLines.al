page 80204 "Strategic Objectives Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategic Objective Subform";

    layout
    {
        area(Content)
        {
            repeater(Outcomes)
            {
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';

                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field(StrategicObjectiveCode; Rec.StrategicObjectiveCode)
                {
                    ToolTip = 'Specifies the value of the Strategic Objective Code field.', Comment = '%';
                }
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
            //             action(OpenOutcomeCard)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'View Outcome Card';
            //                 Image = EditLines;

            //                 var
            //                     OutcomeRec: Record "Outcomes Header";
            // begin
            //     OutcomeRec.Get(Rec."Outcome Code"); 
            //     PAGE.RunModal(80208, OutcomeRec);
            // end;
            //             }

            action(OpenOutcomesCard)
            {
                ApplicationArea = All;
                Caption = 'Go to Outcome Card';
                Image = List;


                trigger OnAction()
                var
                    OutcomeRec: Record "Outcomes Header";
                begin
                    OutcomeRec.SetRange("Outcome Code", Rec."Outcome Code");
                    PAGE.Run(PAGE::"Outcomes Card", OutcomeRec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}