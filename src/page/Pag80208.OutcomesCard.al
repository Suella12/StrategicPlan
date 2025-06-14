page 80208 "Outcomes Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Outcomes Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ToolTip = 'Specifies the value of the Outcome Code field.', Comment = '%';
                }
                field("Outcome Description"; Rec."Outcome Description")
                {
                    ToolTip = 'Specifies the value of the Outcome Description field.', Comment = '%';
                }
                field("Pillar Code"; Rec."Pillar Code")
                {
                    ToolTip = 'Specifies the value of the Pillar field.', Comment = '%';
                }
                field("Pillar Description"; Rec."Pillar Description")
                {
                    ToolTip = 'Specifies the value of the Pillar Description field.', Comment = '%';
                }
                field("Strategic Objective Code"; Rec."Strategic Objective Code")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective Code field.', Comment = '%';
                }
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
            }
            part(Lines; "Outcomes Subform")
            {
                ApplicationArea = All;
                Caption = 'Outputs';
                SubPageLink = "Outcome Code" = field("Outcome Code");
                Updatepropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenOutputList)
            {
                ApplicationArea = All;
                Caption = 'Go to Outputs list';
                Image = List;
                promoted = true;
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Outputs List");
                end;
            }
        }
    }

    var
        myInt: Integer;
}