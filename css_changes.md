# NA

These the things needed when updating the gov.uk css to make it work.

- add to `.govbr-back-link` for backlink

&nbsp;

    border: none;
    background: white;
    color: #0b0c0c;

- Move fonts css to the font css

- Add `font-size: 16px;` to root at top of file underneath
  `--govbr-frontend-version: VERSION NUMBER;`

- Change url links

- For accordion need to fix the css by:

Finding and replacing all `.govbr-frontend-supported .govbr-accordion`
with `.js-enabled .govbr-accordion`

and adding this chunk to the accordion section of css:

    .js-enabled .govbr-accordion__section-toggle {
      pointer-events: none;
    }

- Change filepaths for crown copyright logo:

&nbsp;

    .govbr-footer__copyright-logo {
        display: inline-block;
        min-width: 125px;
        padding-top: 112px;
        background-image: url(../images/govbr-crest.png);
        background-repeat: no-repeat;
        background-position: 50% 0;
        background-size: 125px 102px;
        text-align: center;
        white-space: nowrap
    }

    @media only screen and (-webkit-min-device-pixel-ratio:2),
    only screen and (min-resolution:192dpi),
    only screen and (min-resolution:2dppx) {
        .govbr-footer__copyright-logo {
            background-image: url(../images/govbr-crest-2x.png)
        }
    }

- Fix alignment on the radio button item labels

&nbsp;

    .govbr-radios__input {
        z-index: 1;
        width: 44px;
        height: 44px;
        margin: 0;
        opacity: 0;
        vertical-align: middle;
        cursor: pointer
    }

    .govbr-radios__label {
        align-self: center;
        max-width: calc(100% - 74px);
        display: inline-block;
        padding: 7px 15px;
        cursor: pointer;
        touch-action: manipulation
    }

- Fix selected tab panel border gap

&nbsp;

    .govbr-frontend-supported .govbr-tabs__list-item--selected {
        position: relative;
        margin-top: -5px;
        margin-bottom: -2px;
        padding: 14px 19px 16px;
        border: 1px solid #b1b4b6;
        border-bottom: none;
        background-color: #fff
    }

- govTable caption colour:

&nbsp;

    .govbr-table__caption {
        font-weight: 700;
        display: table-caption;
        text-align: left;
        color: #000;
    }

- contents box:

&nbsp;

    /*Match margin in main-wrapper so "Contents" is level*/
    @media (max-width:40.0625em) {
        .govbr-contents-box {
        margin-right: 30px;
        margin-left: 30px

        }
    }

    /*Match margin in main-wrapper so "Contents" is level*/
    @media (min-width:40.0625em) and (max-width:48.0625em) {
        .govbr-contents-box {
        margin-right: 45px;
        margin-left: 45px

        }
    }


    /*Match margin in main-wrapper so "Contents" is level*/
    @media (min-width:40.0625em) {
        .govbr-contents-box {
             margin-top: 40px;

        }
    }


    /*Do not apply stickyness on smaller screen*/
    @media (min-width:48.0625em) {
    .govbr-contents-box_sticky {
      position: fixed;
      /*Guess? - probably could put exact pixels to make smooth*/
      top: 26px;
      /* Margin 0 to stop the contents box bopping around */
      margin: 0;
      padding: 0;
    }
    }


    /*Contents link formatting*/
    .govbr-contents {
     top: 0.5rem;
     padding: 0.25rem;
    }

    .govbr-contents__link {
      padding-left: 0;
      font-size: 1rem;
    }

    .govbr-subcontents {
      list-style-type: none;
      padding-left: 0;
      font-size: 1rem;
    }

    /*Only display subcontents for first one - on load*/
    .govbr-contents ~ .govbr-contents  > .govbr-subcontents {
      display: none;
    }

- Updated govbr-link–no-visited-state to still have a clear focus
  highlight (copied from the govbr-link formatting)

&nbsp;

    .govbr-link--no-visited-state:active, .govbr-link--no-visited-state:focus {
        outline: 3px solid transparent;
        background-color: #fd0;
        box-shadow: 0 -2px #fd0, 0 4px #0b0c0c;
        text-decoration: none;
        -webkit-box-decoration-break: clone;
        box-decoration-break: clone
    }

    .govbr-link--no-visited-state:hover {
        text-decoration-thickness: max(3px, .1875rem, .12em);
        -webkit-text-decoration-skip-ink: none;
        text-decoration-skip-ink: none;
        -webkit-text-decoration-skip: none;
        text-decoration-skip: none;
        color: #003078
    }

- skip link

&nbsp;

    /*Skip link*/
    .govbr-skip {
      position: absolute;
      left: -10000px;
      top: auto;
      width: 1px;
      height: 1px;
      overflow: hidden;
    }


    .govbr-skip:focus {
      position: static;
      width: auto;
      height: auto;
    }

- Container for the value_box

&nbsp;

    /*Container for value box*/

    .value-box-container {
        font-family: GDS Transport, Arial, sans-serif;
        font-weight: 400;
        font-size: 1rem;
        line-height: 1;
        box-sizing: border-box;
        padding: 10px;
        text-align: left;
        margin-bottom: 15px;
    }

- Larger screens styling for value_box

&nbsp;

    /*Larger screen sizing for value box*/

    @media (min-width: 40.0625em) {
        .value-box-container {
            font-size: 1.2rem;
            padding: 15px;
        }
    }

- Styling for the value in value_box

&nbsp;

    /*Styling value for value box*/

    .value-box-value {
        font-size: 1.5rem;
        line-height: 1;
        font-weight: 700;
        margin: 0;
        display: block;
    }

- Styling for the optional description in value_box

&nbsp;

    /*Styling for optional description for value box*/

    .value-box-description {
        font-size: 1rem;
        line-height: 1;
        margin-top: 10px;
        font-weight: 400;
    }
