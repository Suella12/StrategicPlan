page 80214 "Strategies Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Strategies Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Strategy Code"; Rec."Strategy Code")
                {
                    ToolTip = 'Specifies the value of the Strategy Code field.', Comment = '%';
                }
                field("Strategy Description"; Rec."Strategy Description")
                {
                    ToolTip = 'Specifies the value of the Strategy Description field.', Comment = '%';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ToolTip = 'Specifies the value of the Output Code field.', Comment = '%';
                }
                field("Output Description"; Rec."Output Description")
                {
                    ToolTip = 'Specifies the value of the Output Description field.', Comment = '%';
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';
                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field("Strategic Objective Code"; Rec."Strategic Objective Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective Code field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                }

            }
            part(Lines; "Strategies Subform")
            {
                ApplicationArea = All;
                Caption = 'Strategic Actions';
                SubPageLink = "Strategy Code" = field("Strategy Code");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            //             action(OpenStrategicActionsList)
            //             {
            //                 ApplicationArea = All;
            //                 Caption = 'Go to Strategic Actions list';
            //                 Image = List;
            //                 promoted = true;
            //                 trigger OnAction()
            //                 begin
            // PAGE.Run(PAGE::"Outputs List");
            //                 end;
            //             }
        }
    }

    var
        myInt: Integer;
}