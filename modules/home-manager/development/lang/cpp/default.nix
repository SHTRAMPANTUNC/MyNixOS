{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    cmake
  ];

  home.file.".clang-format".text = '' 
        BasedOnStyle: LLVM
        TabWidth: 4
        UseTab: ForIndentation
        BreakBeforeBraces: Attach
        IndentWidth: 4
        AlignAfterOpenBracket: Align
        ColumnLimit: 90
        BinPackArguments: true
        BinPackParameters: true
        AlignTrailingComments: true
        SpacesBeforeTrailingComments: 8
        SpaceBeforeAssignmentOperators: true
        SpaceBeforeParens: ControlStatements
        AllowShortIfStatementsOnASingleLine: false
        AllowShortCaseLabelsOnASingleLine: true
        AllowShortFunctionsOnASingleLine: false
        IndentCaseLabels: false
        IndentPPDirectives: None
        PenaltyReturnTypeOnItsOwnLine: 0
        PenaltyBreakAssignment: 0
        PenaltyBreakBeforeFirstCallParameter: 1
        PenaltyBreakComment: 1
        PenaltyBreakString: 36
        PenaltyExcessCharacter: 3
        PenaltyBreakFirstLessLess: 0
        PenaltyBreakTemplateDeclaration: 0
        BreakBeforeBinaryOperators: None
        IncludeCategories:
          - Regex:           '<.*\.h>'
            Priority:        1
          - Regex:           '".*\.h"'
            Priority:        2
        SortIncludes: true
        '';
}
