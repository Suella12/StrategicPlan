page 80211 "Outputs Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Output Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
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
            part(Lines; "Outputs Subform")
            {
                ApplicationArea = All;
                Caption = 'Strategies';
                SubpageLink = "Output Code" = field("Output Code");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenStrategiesList)
            {
                ApplicationArea = all;
                Caption = 'Go to Strategies';
                Image = List;
                Promoted = true;

                trigger OnAction()
                begin
                    page.run(page::"Strategies List")
                end;
            }
        }
    }

    var
        myInt: Integer;
}