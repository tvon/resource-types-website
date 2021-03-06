module Card.Styles exposing
    ( authorColor
    , authorFont
    , authorPaddingTop
    , authorSize
    , containerBorderRadius
    , containerHeight
    , containerHoverShadow
    , containerPaddingLeft
    , containerShadow
    , containerSpacing
    , containerWidth
    , descriptionColor
    , descriptionFont
    , descriptionMaxHeight
    , descriptionMaxWidth
    , descriptionMinHeight
    , descriptionPaddingTop
    , descriptionSize
    , descriptionSpacing
    , githubImageHeight
    , githubImagePaddingTop
    , githubImageWidth
    , githubPillBorderRadius
    , githubPillDarkBackgroundColor
    , githubPillFont
    , githubPillFontSize
    , githubPillHeight
    , githubPillImageHeight
    , githubPillImageWidth
    , githubPillLightBackgroundColor
    , githubPillPaddingLeft
    , githubPillPaddingRight
    , githubPillSpacing
    , githubSpacing
    , nameColor
    , nameFont
    , nameMaxWidth
    , namePaddingTop
    , nameSize
    )

import Common.Common as Common exposing (RGB, Shadow)



-- Container


containerHeight : Int
containerHeight =
    Common.gridSize * 20


containerWidth : Int
containerWidth =
    Common.gridSize * 35


containerBorderRadius : Int
containerBorderRadius =
    4


containerSpacing : Int
containerSpacing =
    Common.gridSize * 2


containerPaddingLeft : Int
containerPaddingLeft =
    Common.gridSize * 2


containerShadow : Shadow
containerShadow =
    { offset = ( 0, 2 )
    , blur = 3
    , size = 1
    , color = Common.shadowColor
    }


containerHoverShadow : Shadow
containerHoverShadow =
    { offset = ( 1, 3 )
    , blur = 8
    , size = 1
    , color = Common.shadowColor
    }



-- resource type
-- name


nameSize : Int
nameSize =
    16


nameFont : String
nameFont =
    "Roboto Slab"


nameColor : RGB
nameColor =
    Common.cardTitleColor


namePaddingTop : Int
namePaddingTop =
    Common.gridSize * 3


nameMaxWidth : Int
nameMaxWidth =
    containerWidth - (containerSpacing * 2)



-- author


authorFont : String
authorFont =
    "Roboto Slab"


authorSize : Int
authorSize =
    12


authorColor : RGB
authorColor =
    Common.cardTitleColor


authorPaddingTop : Int
authorPaddingTop =
    Common.gridSize // 4



-- description


descriptionSize : Int
descriptionSize =
    14


descriptionFont : String
descriptionFont =
    "Barlow"


descriptionPaddingTop : Int
descriptionPaddingTop =
    Common.gridSize


descriptionColor : RGB
descriptionColor =
    Common.cardDescriptionColor


descriptionMaxWidth : Int
descriptionMaxWidth =
    containerWidth - (containerSpacing * 2)


descriptionSpacing : Int
descriptionSpacing =
    Common.gridSize // 4


descriptionMaxHeight : Int
descriptionMaxHeight =
    Common.gridSize * 4 + descriptionSize * 2


descriptionMinHeight : Int
descriptionMinHeight =
    descriptionMaxHeight



-- github


githubSpacing : Int
githubSpacing =
    3



--image


githubImageWidth : Int
githubImageWidth =
    Common.gridSize * 2


githubImageHeight : Int
githubImageHeight =
    Common.gridSize * 2


githubImagePaddingTop : Int
githubImagePaddingTop =
    Common.gridSize



-- pill


githubPillLightBackgroundColor : RGB
githubPillLightBackgroundColor =
    Common.githubPillLightBackgroundColor


githubPillDarkBackgroundColor : RGB
githubPillDarkBackgroundColor =
    Common.githubPillDarkBackgroundColor


githubPillHeight : Int
githubPillHeight =
    Common.gridSize * 2


githubPillFontSize : Int
githubPillFontSize =
    10


githubPillFont : String
githubPillFont =
    "iosevka"


githubPillPaddingLeft : Int
githubPillPaddingLeft =
    Common.gridSize // 2


githubPillPaddingRight : Int
githubPillPaddingRight =
    (Common.gridSize // 2) + 2


githubPillSpacing : Int
githubPillSpacing =
    3


githubPillBorderRadius : Int
githubPillBorderRadius =
    5


githubPillImageHeight : Int
githubPillImageHeight =
    10


githubPillImageWidth : Int
githubPillImageWidth =
    10
