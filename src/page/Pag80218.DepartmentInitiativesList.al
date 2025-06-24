page 80218 "Department Initiatives List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = "Dept Initiatives";
    SourceTable = "Departmental Initiatives";
    editable = false;
    CardPageId = 80219;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.', Comment = '%';
                    trigger OnValidate()

                    var
                        DeptRec: Record "Dimension Value";
                    begin
                        if DeptRec.Get(Rec."Department Code") then
                            Rec.Department := DeptRec.Name
                        else
                            Rec.Department := '';

                    end;
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}