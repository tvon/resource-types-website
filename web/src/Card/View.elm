module Card.View exposing (view)

import Card.Card exposing (Author, Description, Github, Name, card)
import Common.Common exposing (ResourceType, capitalize)
import Common.Overrides as Overrides exposing (ellipsis, multiLineEllipsis)
import Element
    exposing
        ( Color
        , Element
        , centerX
        , clip
        , clipY
        , column
        , el
        , fill
        , fromRgb255
        , height
        , html
        , htmlAttribute
        , image
        , maximum
        , minimum
        , mouseOver
        , newTabLink
        , padding
        , paddingEach
        , paragraph
        , px
        , row
        , spacing
        , text
        , width
        )
import Element.Background as Background exposing (gradient)
import Element.Border exposing (rounded, shadow)
import Element.Font as Font exposing (color, family, size, typeface)
import Html
import Html.Attributes exposing (class)


padding : { top : Int, right : Int, bottom : Int, left : Int }
padding =
    { top = 0
    , right = 0
    , bottom = 0
    , left = 0
    }


view : ResourceType -> String -> String -> Element msg
view resourceType githubIcon githubStar =
    let
        container =
            card.container
    in
    newTabLink [ htmlAttribute <| class "card-link" ]
        { url = resourceType.url
        , label =
            el
                [ width <| px container.width
                , height <| px container.height
                , rounded container.borderRadius
                , paddingEach { padding | left = container.paddingLeft }
                , mouseOver
                    [ shadow cardHoverShadow ]
                , shadow cardShadow
                ]
                (column
                    []
                    [ name resourceType card.resourceType.name
                    , author resourceType card.resourceType.author
                    , description resourceType card.resourceType.description
                    , github resourceType card.resourceType.github githubIcon githubStar
                    ]
                )
        }


name : ResourceType -> Name -> Element msg
name resourceType styles =
    paragraph
        [ Font.size styles.size
        , Font.family [ Font.typeface styles.font ]
        , Font.color <| fromRgb255 styles.color
        , height fill
        , width (fill |> maximum styles.maxWidth)
        , paddingEach { padding | top = styles.paddingTop }
        , clip
        ]
        [ html
            (Html.div
                Overrides.ellipsis
                [ Html.text resourceType.name ]
            )
        ]


author : ResourceType -> Author -> Element msg
author resourceType styles =
    paragraph
        [ Font.family
            [ Font.typeface styles.font ]
        , Font.size styles.size
        , Font.color <| fromRgb255 styles.color
        , paddingEach { padding | top = styles.paddingTop }
        ]
        [ text resourceType.username ]


description : ResourceType -> Description -> Element msg
description resourceType styles =
    paragraph
        [ Font.size styles.size
        , Font.family [ Font.typeface styles.font ]
        , Font.color <| fromRgb255 styles.color
        , width (fill |> maximum styles.maxWidth)
        , height (fill |> minimum styles.minHeight)
        , spacing styles.spacing
        , paddingEach { padding | top = styles.paddingTop }
        , clipY
        ]
        [ html
            (Html.div
                (Overrides.multiLineEllipsis 3)
                [ Html.text (capitalize resourceType.description) ]
            )
        ]


github : ResourceType -> Github -> String -> String -> Element msg
github resourceType styles githubIconImg githubStarImg =
    row [ paddingEach { padding | top = styles.image.paddingTop }, spacing styles.spacing ]
        [ image
            [ height <| px styles.image.height
            , width <| px styles.image.width
            ]
            { src = githubIconImg
            , description = ""
            }
        , pill resourceType styles githubStarImg
        ]


pill : ResourceType -> Github -> String -> Element msg
pill resourceType styles githubStarImg =
    row
        [ Background.gradient
            { angle = pi
            , steps =
                [ fromRgb255 styles.pill.lightBackgroundColor
                , fromRgb255 styles.pill.darkBackgroundColor
                ]
            }
        , height <| px styles.pill.height
        , Font.size styles.pill.size
        , Font.family [ Font.typeface styles.pill.font ]
        , rounded styles.pill.borderRadius
        , centerX
        , paddingEach
            { padding
                | left = styles.pill.paddingLeft
                , right = styles.pill.paddingRight
            }
        , spacing styles.pill.spacing
        ]
        [ image
            [ height <| px styles.pill.imageHeight ]
            { src = githubStarImg
            , description = ""
            }
        , text resourceType.stars
        ]


cardShadow : { offset : ( Float, Float ), blur : Float, size : Float, color : Color }
cardShadow =
    let
        shadow =
            card.container.shadow
    in
    { offset = shadow.offset
    , blur = shadow.blur
    , size = shadow.size
    , color = fromRgb255 shadow.color
    }


cardHoverShadow : { offset : ( Float, Float ), blur : Float, size : Float, color : Color }
cardHoverShadow =
    let
        hoverShadow =
            card.container.hoverShadow
    in
    { offset = hoverShadow.offset
    , blur = hoverShadow.blur
    , size = hoverShadow.size
    , color = fromRgb255 hoverShadow.color
    }
