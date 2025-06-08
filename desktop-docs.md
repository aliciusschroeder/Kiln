# Merged Documentation

<basic-format>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Basic format of the
file](basic-format.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](file-naming.html "2. File naming"){.tool-spacer}[[→]{.next-icon}](value-types.html "4. Possible value types"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Basic format of the
file](basic-format.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](file-naming.html "2. File naming"){.tool-spacer}[[→]{.next-icon}](value-types.html "4. Possible value types"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#basic-format .sect1}
::: {.titlepage}
<div>

<div>

[3 ]{.number}[Basic format of the file]{.name dm="urn:x-suse:ns:docmanager"} [\#](basic-format.html "Permalink"){.permalink} {#basic-format .title}
----------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Desktop entry files are encoded in UTF-8. A file is interpreted as a
series of lines that are separated by linefeed characters. Case is
significant everywhere in the file.

Compliant implementations MUST not remove any fields from the file, even
if they don\'t support them. Such fields must be maintained in a list
somewhere, and if the file is \"rewritten\", they will be included. This
ensures that any desktop-specific extensions will be preserved even if
another system accesses and changes the file.

::: {#comments .sect2}
::: {.titlepage}
<div>

<div>

### [3.1 ]{.number}[Comments]{.name dm="urn:x-suse:ns:docmanager"} [\#](basic-format.html#comments "Permalink"){.permalink} {#comments .title}

</div>

</div>
:::

Lines beginning with a `#`{.literal} and blank lines are considered
comments and will be ignored, however they should be preserved across
reads and writes of the desktop entry file.

Comment lines are uninterpreted and may contain any character (except
for LF). However, using UTF-8 for comment lines that contain characters
not in ASCII is encouraged.
:::

::: {#group-header .sect2}
::: {.titlepage}
<div>

<div>

### [3.2 ]{.number}[Group headers]{.name dm="urn:x-suse:ns:docmanager"} [\#](basic-format.html#group-header "Permalink"){.permalink} {#group-header .title}

</div>

</div>
:::

A group header with name `groupname`{.literal} is a line in the format:

::: {.verbatim-wrap}
``` {.programlisting}
[groupname]
```
:::

Group names may contain all ASCII characters except for `[`{.literal}
and `]`{.literal} and control characters.

Multiple groups may not have the same name.

All `{key,value}`{.literal} pairs following a group header until a new
group header belong to the group.

The basic format of the desktop entry file requires that there be a
group header named `Desktop Entry`{.literal}. There may be other groups
present in the file, but this is the most important group which
explicitly needs to be supported. This group should also be used as the
\"magic key\" for automatic MIME type detection. There should be nothing
preceding this group in the desktop entry file but possibly one or more
comments.
:::

::: {#entries .sect2}
::: {.titlepage}
<div>

<div>

### [3.3 ]{.number}[Entries]{.name dm="urn:x-suse:ns:docmanager"} [\#](basic-format.html#entries "Permalink"){.permalink} {#entries .title}

</div>

</div>
:::

Entries in the file are `{key,value}`{.literal} pairs in the format:

::: {.verbatim-wrap}
``` {.programlisting}
Key=Value
```
:::

Space before and after the equals sign should be ignored; the
`=`{.literal} sign is the actual delimiter.

Only the characters `A-Za-z0-9-`{.literal} may be used in key names.

As the case is significant, the keys `Name`{.varname} and
`NAME`{.varname} are not equivalent.

Multiple keys in the same group may not have the same name. Keys in
different groups may have the same name.
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Possible value
types]{.nav-label}](value-types.html){.nav-link}[[←]{.prev-icon}[File
naming]{.nav-label}](file-naming.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</basic-format>
---


<dbus>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}D-Bus Activation](dbus.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](exec-variables.html "7. The Exec key"){.tool-spacer}[[→]{.next-icon}](interfaces.html "9. Interfaces"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: D-Bus
Activation](dbus.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](exec-variables.html "7. The Exec key"){.tool-spacer}[[→]{.next-icon}](interfaces.html "9. Interfaces"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#dbus .sect1}
::: {.titlepage}
<div>

<div>

[8 ]{.number}[D-Bus Activation]{.name dm="urn:x-suse:ns:docmanager"} [\#](dbus.html "Permalink"){.permalink} {#dbus .title}
------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Applications that support being launched by D-Bus must implement the
following interface (given in D-Bus introspection XML format):

::: {.verbatim-wrap}
``` {.programlisting}
  <interface name='org.freedesktop.Application'>
    <method name='Activate'>
      <arg type='a{sv}' name='platform_data' direction='in'/>
    </method>
    <method name='Open'>
      <arg type='as' name='uris' direction='in'/>
      <arg type='a{sv}' name='platform_data' direction='in'/>
    </method>
    <method name='ActivateAction'>
      <arg type='s' name='action_name' direction='in'/>
      <arg type='av' name='parameter' direction='in'/>
      <arg type='a{sv}' name='platform_data' direction='in'/>
    </method>
  </interface>
    
```
:::

The application must name its desktop file in accordance with the naming
recommendations in the introduction section (e.g. the filename must be
like `org.example.FooViewer.desktop`{.literal}). The application must
have a D-Bus service activatable at the well-known name that is equal to
the desktop file name with the `.desktop`{.filename} portion removed
(for our example, `org.example.FooViewer`{.literal}). The above
interface must be implemented at an object path determined as follows:
starting with the well-known D-Bus name of the application, change all
dots to slashes and prefix a slash. If a dash (\'`-`{.literal}\') is
found, convert it to an underscore (\'`_`{.literal}\'). For our example,
this is `/org/example/FooViewer`{.literal}.

The `Activate`{.literal} method is called when the application is
started without files to open.

The `Open`{.literal} method is called when the application is started
with files. The array of strings is an array of URIs, in UTF-8.

The `ActivateAction`{.literal} method is called when [Desktop
Actions](extra-actions.html "11. Additional applications actions"){.link}
are activated. The `action-name`{.literal} parameter is the name of the
action.

All methods take a `platform-data`{.literal} argument that is used in a
similar way to how environment variables might be used. Current fields
described by the specification are:

::: {.itemizedlist}
-   `desktop-startup-id`{.varname}: This should be a string of the same
    value as would be stored in the `DESKTOP_STARTUP_ID`{.varname}
    environment variable, as specified by the [Startup Notification
    Protocol Specification[
    (http://www.freedesktop.org/Standards/startup-notification-spec)]{.ulink-url}](http://www.freedesktop.org/Standards/startup-notification-spec){.ulink}.

-   `activation-token`{.varname}: This should be a string of the same
    value as would be stored in the `XDG_ACTIVATION_TOKEN`{.varname}
    environment variable, as specified by the [XDG Activation[
    (https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/staging/xdg-activation/xdg-activation-v1.xml)]{.ulink-url}](https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/staging/xdg-activation/xdg-activation-v1.xml){.ulink}
    protocol for Wayland.
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Interfaces]{.nav-label}](interfaces.html){.nav-link}[[←]{.prev-icon}[The
`Exec`{.varname} key]{.nav-label}](exec-variables.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</dbus>
---


<example>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Example Desktop Entry
File](example.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](extending.html "12. Extending the format"){.tool-spacer}[[→]{.next-icon}](kde-items.html "B. Currently reserved for use within KDE"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Example Desktop Entry
File](example.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](extending.html "12. Extending the format"){.tool-spacer}[[→]{.next-icon}](kde-items.html "B. Currently reserved for use within KDE"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#example .appendix}
::: {.titlepage}
<div>

<div>

[A ]{.number}[Example Desktop Entry File]{.name dm="urn:x-suse:ns:docmanager"} [\#](example.html "Permalink"){.permalink} {#a-example-desktop-entry-file .title}
-------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

::: {.line}
:::

::: {.verbatim-wrap}
``` {.programlisting}
[Desktop Entry]
Version=1.0
Type=Application
Name=Foo Viewer
Comment=The best viewer for Foo objects available!
TryExec=fooview
Exec=fooview %F
Icon=fooview
MimeType=image/x-foo;
Actions=Gallery;Create;

[Desktop Action Gallery]
Exec=fooview --gallery
Name=Browse Gallery

[Desktop Action Create]
Exec=fooview --create-new
Name=Create a new Foo!
Icon=fooview-new
    
```
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[[Appendix B ]{.number}Currently reserved for use within
KDE]{.nav-label}](kde-items.html){.nav-link}[[←]{.prev-icon}[Extending
the format]{.nav-label}](extending.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</example>
---


<exec-variables>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}The Exec
key](exec-variables.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](recognized-keys.html "6. Recognized desktop entry keys"){.tool-spacer}[[→]{.next-icon}](dbus.html "8. D-Bus Activation"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: The Exec
key](exec-variables.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](recognized-keys.html "6. Recognized desktop entry keys"){.tool-spacer}[[→]{.next-icon}](dbus.html "8. D-Bus Activation"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#exec-variables .sect1}
::: {.titlepage}
<div>

<div>

[7 ]{.number}[The `Exec`{.varname} key]{.name dm="urn:x-suse:ns:docmanager"} [\#](exec-variables.html "Permalink"){.permalink} {#exec-variables .title}
------------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

The `Exec`{.varname} key must contain a command line. A command line
consists of an executable program optionally followed by one or more
arguments. The executable program can either be specified with its full
path or with the name of the executable only. If no full path is
provided the executable is looked up in the \$PATH environment variable
used by the desktop environment. The name or path of the executable
program may not contain the equal sign (\"=\"). Arguments are separated
by a space.

Arguments may be quoted in whole. If an argument contains a reserved
character the argument must be quoted. The rules for quoting of
arguments is also applicable to the executable name or path of the
executable program as provided.

Quoting must be done by enclosing the argument between double quotes and
escaping the double quote character, backtick character (\"\`\"), dollar
sign (\"\$\") and backslash character (\"\\\") by preceding it with an
additional backslash character. Implementations must undo quoting before
expanding field codes and before passing the argument to the executable
program. Reserved characters are space (\" \"), tab, newline, double
quote, single quote (\"\'\"), backslash character (\"\\\"), greater-than
sign (\"\>\"), less-than sign (\"\<\"), tilde (\"\~\"), vertical bar
(\"\|\"), ampersand (\"&\"), semicolon (\";\"), dollar sign (\"\$\"),
asterisk (\"\*\"), question mark (\"?\"), hash mark (\"\#\"),
parenthesis (\"(\") and (\")\") and backtick character (\"\`\").

Note that the general escape rule for values of type string states that
the backslash character can be escaped as (\"\\\\\") as well and that
this escape rule is applied before the quoting rule. As such, to
unambiguously represent a literal backslash character in a quoted
argument in a desktop entry file requires the use of four successive
backslash characters (\"\\\\\\\\\"). Likewise, a literal dollar sign in
a quoted argument in a desktop entry file is unambiguously represented
with (\"\\\\\$\").

A number of special field codes have been defined which will be expanded
by the file manager or program launcher when encountered in the command
line. Field codes consist of the percentage character (\"%\") followed
by an alpha character. Literal percentage characters must be escaped as
`%%`{.literal}. Deprecated field codes should be removed from the
command line and ignored. Field codes are expanded only once, the string
that is used to replace the field code should not be checked for field
codes itself.

Command lines that contain a field code that is not listed in this
specification are invalid and must not be processed, in particular
implementations may not introduce support for field codes not listed in
this specification. Extensions, if any, should be introduced by means of
a new key.

Implementations must take care not to expand field codes into multiple
arguments unless explicitly instructed by this specification. This means
that name fields, filenames and other replacements that can contain
spaces must be passed as a single argument to the executable program
after expansion.

Although the `Exec`{.varname} key is defined to have a value of the type
string, which is limited to ASCII characters, field code expansion may
introduce non-ASCII characters in arguments. Implementations must take
care that all characters in arguments passed to the executable program
are properly encoded according to the applicable locale setting.

Recognized field codes are as follows:

::: {.informaltable}
  Code             Description
  ---------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `%f`{.literal}   A single file name (including the path), even if multiple files are selected. The system reading the desktop entry should recognize that the program in question cannot handle multiple file arguments, and it should should probably spawn and execute multiple copies of a program for each selected file if the program is not able to handle additional file arguments. If files are not on the local file system (i.e. are on HTTP or FTP locations), the files will be copied to the local file system and `%f`{.literal} will be expanded to point at the temporary file. Used for programs that do not understand the URL syntax.
  `%F`{.literal}   A list of files. Use for apps that can open several local files at once. Each file is passed as a separate argument to the executable program.
  `%u`{.literal}   A single URL. Local files may either be passed as file: URLs or as file path.
  `%U`{.literal}   A list of URLs. Each URL is passed as a separate argument to the executable program. Local files may either be passed as file: URLs or as file path.
  `%d`{.literal}   Deprecated.
  `%D`{.literal}   Deprecated.
  `%n`{.literal}   Deprecated.
  `%N`{.literal}   Deprecated.
  `%i`{.literal}   The `Icon`{.varname} key of the desktop entry expanded as two arguments, first `--icon`{.literal} and then the value of the `Icon`{.varname} key. Should not expand to any arguments if the `Icon`{.varname} key is empty or missing.
  `%c`{.literal}   The translated name of the application as listed in the appropriate `Name`{.varname} key in the desktop entry.
  `%k`{.literal}   The location of the desktop file as either a URI (if for example gotten from the vfolder system) or a local filename or empty if no location is known.
  `%v`{.literal}   Deprecated.
  `%m`{.literal}   Deprecated.
:::

A command line may contain at most one %f, %u, %F or %U field code. If
the application should not open any file the %f, %u, %F and %U field
codes must be removed from the command line and ignored.

Field codes must not be used inside a quoted argument, the result of
field code expansion inside a quoted argument is undefined. The %F and
%U field codes may only be used as an argument on their own.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[D-Bus
Activation]{.nav-label}](dbus.html){.nav-link}[[←]{.prev-icon}[Recognized
desktop entry keys]{.nav-label}](recognized-keys.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</exec-variables>
---


<extending>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Extending the
format](extending.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](extra-actions.html "11. Additional applications actions"){.tool-spacer}[[→]{.next-icon}](example.html "A. Example Desktop Entry File"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Extending the
format](extending.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](extra-actions.html "11. Additional applications actions"){.tool-spacer}[[→]{.next-icon}](example.html "A. Example Desktop Entry File"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#extending .sect1}
::: {.titlepage}
<div>

<div>

[12 ]{.number}[Extending the format]{.name dm="urn:x-suse:ns:docmanager"} [\#](extending.html "Permalink"){.permalink} {#extending .title}
----------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

If the standard is to be amended with a new `{key,value}`{.literal} pair
which should be applicable to all supporting parties, a group discussion
will take place. This is the preferred method for introducing changes.
If one particular party wishes to add a field for personal use, they
should prefix the key with the string `X-PRODUCT`{.varname}, e.g.
`X-NewDesktop-Foo`{.varname}, following the precedent set by other IETF
and RFC standards.

Alternatively, fields can be placed in their own group, where they may
then have arbitrary key names. If this is the case, the group should
follow the scheme outlined above, i.e.
`[X-PRODUCT       GROUPNAME]`{.literal} or something similar. These
steps will avoid namespace clashes between different yet similar
environments.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[[Appendix A ]{.number}Example Desktop Entry
File]{.nav-label}](example.html){.nav-link}[[←]{.prev-icon}[Additional
applications actions]{.nav-label}](extra-actions.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</extending>
---


<extra-actions>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Additional applications
actions](extra-actions.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](mime-types.html "10. Registering MIME Types"){.tool-spacer}[[→]{.next-icon}](extending.html "12. Extending the format"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Additional applications
actions](extra-actions.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](mime-types.html "10. Registering MIME Types"){.tool-spacer}[[→]{.next-icon}](extending.html "12. Extending the format"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#extra-actions .sect1}
::: {.titlepage}
<div>

<div>

[11 ]{.number}[Additional applications actions]{.name dm="urn:x-suse:ns:docmanager"} [\#](extra-actions.html "Permalink"){.permalink} {#extra-actions .title}
-------------------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Desktop entries of type Application can include one or more actions. An
action represents an additional way to invoke the application.
Application launchers should expose them to the user (for example, as a
submenu) within the context of the application. This is used to build so
called \"Quicklists\" or \"Jumplists\".

::: {#extra-actions-identifier .sect2}
::: {.titlepage}
<div>

<div>

### [11.1 ]{.number}[Action identifier]{.name dm="urn:x-suse:ns:docmanager"} [\#](extra-actions.html#extra-actions-identifier "Permalink"){.permalink} {#extra-actions-identifier .title}

</div>

</div>
:::

Each action is identified by a string, following the same format as key
names (see [Section 3.3,
"Entries"](basic-format.html#entries "3.3. Entries"){.xref}). Each
identifier is associated with an action group that must be present in
the `.desktop`{.filename} file. The action group is a group named
`Desktop Action %s`{.varname}, where `%s`{.varname} is the action
identifier.

It is not valid to have an action group for an action identifier not
mentioned in the `Actions`{.varname} key. Such an action group must be
ignored by implementors.
:::

::: {#extra-actions-keys .sect2}
::: {.titlepage}
<div>

<div>

### [11.2 ]{.number}[Action keys]{.name dm="urn:x-suse:ns:docmanager"} [\#](extra-actions.html#extra-actions-keys "Permalink"){.permalink} {#extra-actions-keys .title}

</div>

</div>
:::

The following keys are supported within each action group. If a REQUIRED
key is not present in an action group, then the implementor should
ignore this action.

::: {#id-1.12.4.3 .table}
::: {.table-title-wrap}
###### [Table 3: ]{.number}[Action Specific Keys ]{.name}[\#](extra-actions.html#id-1.12.4.3 "Permalink"){.permalink} {#table-3-action-specific-keys .table-title}
:::

::: {.table-contents}
  Key                Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 Value Type     REQ?    
  ------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------- ------ ---
  `Name`{.varname}   Label that will be shown to the user. Since actions are always shown in the context of a specific application (that is, as a submenu of a launcher), this only needs to be unambiguous within one application and should not include the application name.                                                                                                                                                                                                                                                  localestring   YES     
  `Icon`{.varname}   Icon to be shown together with the action. If the name is an absolute path, the given file will be used. If the name is not an absolute path, the algorithm described in the [Icon Theme Specification[ (http://freedesktop.org/wiki/Standards/icon-theme-spec)]{.ulink-url}](http://freedesktop.org/wiki/Standards/icon-theme-spec){.ulink} will be used to locate the icon. Implementations may choose to ignore it.                                                                                      iconstring     NO      
  `Exec`{.varname}   Program to execute for this action, possibly with arguments. See the [`Exec`{.varname} key](exec-variables.html "7. The Exec key"){.link} for details on how this key works. The `Exec`{.varname} key is required if `DBusActivatable`{.varname} is not set to `true`{.literal} in the main desktop entry group. Even if `DBusActivatable`{.varname} is `true`{.literal}, `Exec`{.varname} should be specified for compatibility with implementations that do not understand `DBusActivatable`{.varname}.   string         NO      
:::
:::
:::

::: {#extra-actions-implementation-notes .sect2}
::: {.titlepage}
<div>

<div>

### [11.3 ]{.number}[Implementation notes]{.name dm="urn:x-suse:ns:docmanager"} [\#](extra-actions.html#extra-actions-implementation-notes "Permalink"){.permalink} {#extra-actions-implementation-notes .title}

</div>

</div>
:::

Application actions should be supported by implementors. However, in
case they are not supported, implementors can simply ignore the
`Actions`{.varname} key and the associated
`Desktop         Action`{.varname} action groups, and keep using the
`Desktop         Entry`{.varname} group: the primary way to describe and
invoke the application is through the Name, Icon and Exec keys from the
`Desktop Entry`{.varname} group.

It is not expected that other desktop components showing application
lists (software installers, for instance) will provide any user
interface for these actions. Therefore applications must only include
actions that make sense as general launchers.
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Extending the
format]{.nav-label}](extending.html){.nav-link}[[←]{.prev-icon}[Registering
MIME Types]{.nav-label}](mime-types.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</extra-actions>
---


<file-naming>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}File naming](file-naming.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](index.html "Desktop Entry Specification"){.tool-spacer}[[→]{.next-icon}](basic-format.html "3. Basic format of the file"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: File
naming](file-naming.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](index.html "Desktop Entry Specification"){.tool-spacer}[[→]{.next-icon}](basic-format.html "3. Basic format of the file"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#file-naming .sect1}
::: {.titlepage}
<div>

<div>

[2 ]{.number}[File naming]{.name dm="urn:x-suse:ns:docmanager"} [\#](file-naming.html "Permalink"){.permalink} {#file-naming .title}
--------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Desktop entry files should have the `.desktop`{.filename} extension,
except for files of `Type`{.varname} `Directory`{.constant} which should
have the `.directory`{.filename} extension. Determining file type on
basis of extension makes determining the file type very easy and quick.
When no file extension is present, the desktop system should fall back
to recognition via \"magic detection\".

For applications, the part of the name of the desktop file before the
`.desktop`{.filename} extension should be a valid [D-Bus well-known
name[
(https://dbus.freedesktop.org/doc/dbus-specification.html\#message-protocol-names)]{.ulink-url}](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names){.ulink}.
This means that it is a sequence of non-empty elements separated by dots
(U+002E FULL STOP), none of which starts with a digit, and each of which
contains only characters from the set `[A-Za-z0-9-_]`{.literal}: ASCII
letters, digits, dash (U+002D HYPHEN-MINUS) and underscore (U+005F LOW
LINE).

The name of the desktop entry should follow the \"reverse DNS\"
convention: it should start with a reversed DNS domain name controlled
by the author of the application, in lower case. The domain name should
be followed by the name of the application, which is conventionally
written with words run together and initial capital letters (CamelCase).
For example, if the owner of `example.org`{.literal} writes \"Foo
Viewer\", they might choose the name `org.example.FooViewer`{.literal},
resulting in a file named `org.example.FooViewer.desktop`{.literal}.

Well-known names containing the dash are allowed but not recommended,
because the dash is not allowed in some related uses of reversed DNS
names, such as D-Bus object paths and interface names, and Flatpak app
IDs. If the author\'s domain name contains a dash, replacing it with an
underscore is recommended: this cannot cause ambiguity, because
underscores are not allowed in DNS domain names.

If the author\'s domain name contains a label starting with a digit,
(which is not allowed in D-Bus well-known names), prepending an
underscore to that element of the desktop entry name is recommended. For
example, 7-zip.org might release an application named
`org._7_zip.Archiver`{.literal}.

::: {#desktop-file-id .sect2}
::: {.titlepage}
<div>

<div>

### [2.1 ]{.number}[Desktop File ID]{.name dm="urn:x-suse:ns:docmanager"} [\#](file-naming.html#desktop-file-id "Permalink"){.permalink} {#desktop-file-id .title}

</div>

</div>
:::

Each desktop entry representing an application is identified by its
*desktop file ID*, which is based on its filename.

To determine the ID of a desktop file, make its full path relative to
the `$XDG_DATA_DIRS`{.literal} component in which the desktop file is
installed, remove the \"applications/\" prefix, and turn \'/\' into
\'-\'.

For example `/usr/share/applications/foo/bar.desktop`{.filename} has the
desktop file ID `foo-bar.desktop`{.literal}.

If multiple files have the same desktop file ID, the first one in the
\$XDG\_DATA\_DIRS precedence order is used.

For example, if `$XDG_DATA_DIRS`{.literal} contains the default paths
/usr/local/share:/usr/share, then
`/usr/local/share/applications/org.foo.bar.desktop`{.filename} and
`/usr/share/applications/org.foo.bar.desktop`{.filename} both have the
same desktop file ID `org.foo.bar.desktop`{.literal}, but only the first
one will be used.

If both `foo-bar.desktop`{.filename} and `foo/bar.desktop`{.filename}
exist, it is undefined which is selected.

If the desktop file is not installed in an `applications`{.literal}
subdirectory of one of the \$XDG\_DATA\_DIRS components, it does not
have an ID.
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Basic format of the
file]{.nav-label}](basic-format.html){.nav-link}[[←]{.prev-icon}[Desktop
Entry Specification]{.nav-label}](index.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</file-naming>
---


<index>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Desktop Entry
Specification](index.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
:::

::: {#_nav-area .inactive}
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Desktop Entry
Specification](index.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#index .article}
::: {.titlepage}
<div>

<div>

[ ]{.number}[Desktop Entry Specification]{.name dm="urn:x-suse:ns:docmanager"} [\#](index.html "Permalink"){.permalink} {#desktop-entry-specification .title}
-----------------------------------------------------------------------------------------------------------------------

</div>

::: {.authorgroup}
<div>

[Authors: ]{.imprint-label}

::: {.author-info}
[Preston Brown ]{.author-name}`<pbrown@kde.org>`{.email}
:::

::: {.author-info}
[Jonathan Blandford ]{.author-name}`<jrb@redhat.com>`{.email}
:::

::: {.author-info}
[Owen Taylor ]{.author-name}`<otaylor@gtk.org>`{.email}
:::

::: {.author-info}
[Vincent Untz ]{.author-name}`<vuntz@gnome.org>`{.email}
:::

::: {.author-info}
[Waldo Bastian ]{.author-name}`<waldo.bastian@intel.com>`{.email}
:::

::: {.author-info}
[Allison Lortie ]{.author-name}`<desrt@desrt.ca>`{.email}
:::

::: {.author-info}
[David Faure ]{.author-name}`<faure@kde.org>`{.email}
:::

::: {.author-info}
[Will Thompson ]{.author-name}`<wjt@endlessos.org>`{.email}
:::

</div>

\
:::

::: {.date}
[Publication Date: ]{.imprint-label}2020-04-27, [Version:
]{.imprint-label}Version 1.5
:::

</div>
:::

::: {.line}
::: {.toc}
[[[1 ]{.number}[Introduction]{.name}](index.html#introduction)]{.sect1}

[[[2 ]{.number}[File naming]{.name}](file-naming.html)]{.sect1}

[[[3 ]{.number}[Basic format of the
file]{.name}](basic-format.html)]{.sect1}

[[[4 ]{.number}[Possible value types]{.name}](value-types.html)]{.sect1}

[[[5 ]{.number}[Localized values for
keys]{.name}](localized-keys.html)]{.sect1}

[[[6 ]{.number}[Recognized desktop entry
keys]{.name}](recognized-keys.html)]{.sect1}

[[[7 ]{.number}[The `Exec`{.varname}
key]{.name}](exec-variables.html)]{.sect1}

[[[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)]{.sect1}

[[[9 ]{.number}[Interfaces]{.name}](interfaces.html)]{.sect1}

[[[10 ]{.number}[Registering MIME
Types]{.name}](mime-types.html)]{.sect1}

[[[11 ]{.number}[Additional applications
actions]{.name}](extra-actions.html)]{.sect1}

[[[12 ]{.number}[Extending the format]{.name}](extending.html)]{.sect1}

[[[A ]{.number}[Example Desktop Entry
File]{.name}](example.html)]{.appendix}

[[[B ]{.number}[Currently reserved for use within
KDE]{.name}](kde-items.html)]{.appendix}

[[[C ]{.number}[Deprecated
Items]{.name}](deprecated-items.html)]{.appendix}

[[[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
(Deprecated)]{.name}](legacy-mixed.html)]{.appendix}

[[[E ]{.number}[Changes to this
Specification]{.name}](ape.html)]{.appendix}

[[[E.1 ]{.number}[Changes from version 1.4 to
1.5]{.name}](ape.html#id-1.18.2)]{.section}

[[[E.2 ]{.number}[Changes from version 1.3 to
1.4]{.name}](apes02.html)]{.section}

[[[E.3 ]{.number}[Changes from version 1.2 to
1.3]{.name}](apes03.html)]{.section}

[[[E.4 ]{.number}[Changes from version 1.1 to
1.2]{.name}](apes04.html)]{.section}

[[[E.5 ]{.number}[Changes from version 1.0 to
1.1]{.name}](apes05.html)]{.section}
:::
:::

::: {#introduction .sect1}
::: {.titlepage}
<div>

<div>

[1 ]{.number}[Introduction]{.name dm="urn:x-suse:ns:docmanager"} [\#](index.html#introduction "Permalink"){.permalink} {#introduction .title}
----------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Both the KDE and GNOME desktop environments have adopted a similar
format for \"desktop entries\", or configuration files describing how a
particular program is to be launched, how it appears in menus, etc. It
is to the larger community\'s benefit that a unified standard be agreed
upon by all parties such that interoperation between the two
environments, and indeed any additional environments that implement the
specification, becomes simpler.
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[File naming]{.nav-label}](file-naming.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</index>
---


<interfaces>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Interfaces](interfaces.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](dbus.html "8. D-Bus Activation"){.tool-spacer}[[→]{.next-icon}](mime-types.html "10. Registering MIME Types"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents:
Interfaces](interfaces.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](dbus.html "8. D-Bus Activation"){.tool-spacer}[[→]{.next-icon}](mime-types.html "10. Registering MIME Types"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#interfaces .sect1}
::: {.titlepage}
<div>

<div>

[9 ]{.number}[Interfaces]{.name dm="urn:x-suse:ns:docmanager"} [\#](interfaces.html "Permalink"){.permalink} {#interfaces .title}
------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

The `Implements`{.varname} key can be used to declare one or more
interfaces that a desktop file implements.

Each interface name must follow the rules used for D-Bus interface
names, but other than that, they have no particular meaning. For
instance, listing an interface here does not necessarily mean that this
application implements that D-Bus interface or even that such a D-Bus
interface exists. It is entirely up to the entity who defined a
particular interface to define what it means to implement it.

Although it is entirely up to the designer of the interface to decide
what a given interface name means, here are some recommended \"best
practices\":

::: {.itemizedlist}
-   interfaces should require that application is DBusActivatable,
    including the requirement that the application\'s desktop file is
    named using the D-Bus \"reverse DNS\" convention

-   the interface name should correspond to a D-Bus interface that the
    application exports on the same object path as it exports the
    org.freedesktop.Application interface

-   if the interface wishes to allow for details about the
    implementation, it should do so by specifying that implementers add
    a group in their desktop file with the same name as the interface
    (eg: \"\[org.freedesktop.ImageAcquire\]\")
:::

Recommendations notwithstanding, interfaces could specify almost any
imaginable requirement including such (ridiculous) things as \"when
launched via the Exec line, the application is expected to present a
window with the \_FOO\_IDENTIFIER property set, at which point an X
client message will be sent to that window\". Another example is \"all
implementations of this interface are expected to be marked NoDisplay
and, on launch, will present no windows and will delete all of the
user\'s files without confirmation\".

Interface definers should take care to keep issues of backward and
forward compatibility in mind when designing their interfaces.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Registering MIME
Types]{.nav-label}](mime-types.html){.nav-link}[[←]{.prev-icon}[D-Bus
Activation]{.nav-label}](dbus.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</interfaces>
---


<localized-keys>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Localized values for
keys](localized-keys.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](value-types.html "4. Possible value types"){.tool-spacer}[[→]{.next-icon}](recognized-keys.html "6. Recognized desktop entry keys"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Localized values for
keys](localized-keys.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](value-types.html "4. Possible value types"){.tool-spacer}[[→]{.next-icon}](recognized-keys.html "6. Recognized desktop entry keys"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#localized-keys .sect1}
::: {.titlepage}
<div>

<div>

[5 ]{.number}[Localized values for keys]{.name dm="urn:x-suse:ns:docmanager"} [\#](localized-keys.html "Permalink"){.permalink} {#localized-keys .title}
-------------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Keys with type `localestring`{.literal} and `iconstring`{.literal} may
be postfixed by \[*LOCALE*\], where *LOCALE* is the locale type of the
entry. *LOCALE* must be of the form
`lang_COUNTRY.ENCODING@MODIFIER`{.literal}, where `_COUNTRY`{.literal},
`.ENCODING`{.literal}, and `@MODIFIER`{.literal} may be omitted. If a
postfixed key occurs, the same key must be also present without the
postfix.

When reading in the desktop entry file, the value of the key is selected
by matching the current POSIX locale for the `LC_MESSAGES`{.varname}
category against the *LOCALE* postfixes of all occurrences of the key,
with the `.ENCODING`{.literal} part stripped.

The matching is done as follows. If `LC_MESSAGES`{.varname} is of the
form `lang_COUNTRY.ENCODING@MODIFIER`{.literal}, then it will match a
key of the form `lang_COUNTRY@MODIFIER`{.literal}. If such a key does
not exist, it will attempt to match `lang_COUNTRY`{.literal} followed by
`lang@MODIFIER`{.literal}. Then, a match against *lang* by itself will
be attempted. Finally, if no matching key is found the required key
without a locale specified is used. The encoding from the
`LC_MESSAGES`{.varname} value is ignored when matching.

If `LC_MESSAGES`{.varname} does not have a *MODIFIER* field, then no key
with a modifier will be matched. Similarly, if `LC_MESSAGES`{.varname}
does not have a *COUNTRY* field, then no key with a country specified
will be matched. If `LC_MESSAGES`{.varname} just has a *lang* field,
then it will do a straight match to a key with a similar value. The
following table lists possible matches of various
`LC_MESSAGES`{.varname} values in the order in which they are matched.
Note that the *ENCODING* field isn\'t shown.

::: {#id-1.6.6 .table}
::: {.table-title-wrap}
###### [Table 1: ]{.number}[Locale Matching ]{.name}[\#](localized-keys.html#id-1.6.6 "Permalink"){.permalink} {#table-1-locale-matching .table-title}
:::

::: {.table-contents}
  `LC_MESSAGES`{.varname} value       Possible keys in order of matching
  ----------------------------------- -------------------------------------------------------------------------------------------------------------------------
  `lang_COUNTRY@MODIFIER`{.literal}   `lang_COUNTRY@MODIFIER`{.literal}, `lang_COUNTRY`{.literal}, `lang@MODIFIER`{.literal}, `lang`{.literal}, default value
  `lang_COUNTRY`{.literal}            `lang_COUNTRY`{.literal}, *lang*, default value
  `lang@MODIFIER`{.literal}           `lang@MODIFIER`{.literal}, *lang*, default value
  *lang*                              *lang*, default value
:::
:::

For example, if the current value of the `LC_MESSAGES`{.varname}
category is `sr_YU@Latn`{.literal} and the desktop file includes:

::: {.verbatim-wrap}
``` {.programlisting}
 Name=Foo
 Name[sr_YU]=...
 Name[sr@Latn]=...
 Name[sr]=...
```
:::

then the value of the `Name`{.varname} keyed by `sr_YU`{.literal} is
used.

Although icon names of type `iconstring`{.literal} are localizable, they
are not human-readable strings, so should typically not be handled by
translation tools. Most applications are not expected to localize their
icons; exceptions might include icons containing text or
culture-specific symbology.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Recognized desktop entry
keys]{.nav-label}](recognized-keys.html){.nav-link}[[←]{.prev-icon}[Possible
value types]{.nav-label}](value-types.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</localized-keys>
---


<mime-types>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Registering MIME
Types](mime-types.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](interfaces.html "9. Interfaces"){.tool-spacer}[[→]{.next-icon}](extra-actions.html "11. Additional applications actions"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Registering MIME
Types](mime-types.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](interfaces.html "9. Interfaces"){.tool-spacer}[[→]{.next-icon}](extra-actions.html "11. Additional applications actions"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#mime-types .sect1}
::: {.titlepage}
<div>

<div>

[10 ]{.number}[Registering MIME Types]{.name dm="urn:x-suse:ns:docmanager"} [\#](mime-types.html "Permalink"){.permalink} {#mime-types .title}
-------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

The `MimeType`{.varname} key is used to indicate the MIME Types that an
application knows how to handle. It is expected that for some
applications this list could become long. An application is expected to
be able to reasonably open files of these types using the command listed
in the `Exec`{.varname} key.

There should be no priority for MIME Types in this field, or any form of
priority in the desktop file. Priority for applications is handled
external to the `.desktop`{.filename} files.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Additional applications
actions]{.nav-label}](extra-actions.html){.nav-link}[[←]{.prev-icon}[Interfaces]{.nav-label}](interfaces.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</mime-types>
---


<recognized-keys>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Recognized desktop entry
keys](recognized-keys.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](localized-keys.html "5. Localized values for keys"){.tool-spacer}[[→]{.next-icon}](exec-variables.html "7. The Exec key"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Recognized desktop entry
keys](recognized-keys.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](localized-keys.html "5. Localized values for keys"){.tool-spacer}[[→]{.next-icon}](exec-variables.html "7. The Exec key"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#recognized-keys .sect1}
::: {.titlepage}
<div>

<div>

[6 ]{.number}[Recognized desktop entry keys]{.name dm="urn:x-suse:ns:docmanager"} [\#](recognized-keys.html "Permalink"){.permalink} {#recognized-keys .title}
------------------------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

Keys are either OPTIONAL or REQUIRED. If a key is OPTIONAL it may or may
not be present in the file. However, if it isn\'t, the implementation of
the standard should not blow up, it must provide some sane defaults.

Some keys only make sense in the context when another particular key is
also present and set to a specific value. Those keys should not be used
if the particular key is not present or not set to the specific value.
For example, the `Terminal`{.varname} key can only be used when the
value of the `Type`{.varname} key is `Application`{.constant}.

If a REQUIRED key is only valid in the context of another key set to a
specific value, then it has to be present only if the other key is set
to the specific value. For example, the `URL`{.varname} key has to be
present when and only when when the value of the `Type`{.varname} key is
`Link`{.constant}.

Some example keys: `Name[C]`{.varname}, `Comment[it]`{.varname}.

::: {#id-1.7.6 .table}
::: {.table-title-wrap}
###### [Table 2: ]{.number}[Standard Keys ]{.name}[\#](recognized-keys.html#id-1.7.6 "Permalink"){.permalink} {#table-2-standard-keys .table-title}
:::

::: {.table-contents}
+-----------------+-----------------+-----------------+------+------+
| Key             | Description     | Value Type      | REQ? | Type |
+=================+=================+=================+======+======+
| `               | This            | string          | YES  |      |
| Type`{.varname} | specification   |                 |      |      |
|                 | defines 3 types |                 |      |      |
|                 | of desktop      |                 |      |      |
|                 | entries:        |                 |      |      |
|                 | `Applicat       |                 |      |      |
|                 | ion`{.constant} |                 |      |      |
|                 | (type 1),       |                 |      |      |
|                 | `L              |                 |      |      |
|                 | ink`{.constant} |                 |      |      |
|                 | (type 2) and    |                 |      |      |
|                 | `Direct         |                 |      |      |
|                 | ory`{.constant} |                 |      |      |
|                 | (type 3). To    |                 |      |      |
|                 | allow the       |                 |      |      |
|                 | addition of new |                 |      |      |
|                 | types in the    |                 |      |      |
|                 | future,         |                 |      |      |
|                 | implementations |                 |      |      |
|                 | should ignore   |                 |      |      |
|                 | desktop entries |                 |      |      |
|                 | with an unknown |                 |      |      |
|                 | type.           |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Ver            | Version of the  | string          | NO   | 1-3  |
| sion`{.varname} | Desktop Entry   |                 |      |      |
|                 | Specification   |                 |      |      |
|                 | that the        |                 |      |      |
|                 | desktop entry   |                 |      |      |
|                 | conforms with.  |                 |      |      |
|                 | Entries that    |                 |      |      |
|                 | confirm with    |                 |      |      |
|                 | this version of |                 |      |      |
|                 | the             |                 |      |      |
|                 | specification   |                 |      |      |
|                 | should use      |                 |      |      |
|                 | `               |                 |      |      |
|                 | 1.5`{.literal}. |                 |      |      |
|                 | Note that the   |                 |      |      |
|                 | version field   |                 |      |      |
|                 | is not required |                 |      |      |
|                 | to be present.  |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `               | Specific name   | localestring    | YES  | 1-3  |
| Name`{.varname} | of the          |                 |      |      |
|                 | application,    |                 |      |      |
|                 | for example     |                 |      |      |
|                 | \"Mozilla\".    |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Generic        | Generic name of | localestring    | NO   | 1-3  |
| Name`{.varname} | the             |                 |      |      |
|                 | application,    |                 |      |      |
|                 | for example     |                 |      |      |
|                 | \"Web           |                 |      |      |
|                 | Browser\".      |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `NoDis          | `NoDis          | boolean         | NO   | 1-3  |
| play`{.varname} | play`{.varname} |                 |      |      |
|                 | means \"this    |                 |      |      |
|                 | application     |                 |      |      |
|                 | exists, but     |                 |      |      |
|                 | don\'t display  |                 |      |      |
|                 | it in the       |                 |      |      |
|                 | menus\". This   |                 |      |      |
|                 | can be useful   |                 |      |      |
|                 | to e.g.         |                 |      |      |
|                 | associate this  |                 |      |      |
|                 | application     |                 |      |      |
|                 | with MIME       |                 |      |      |
|                 | types, so that  |                 |      |      |
|                 | it gets         |                 |      |      |
|                 | launched from a |                 |      |      |
|                 | file manager    |                 |      |      |
|                 | (or other       |                 |      |      |
|                 | apps), without  |                 |      |      |
|                 | having a menu   |                 |      |      |
|                 | entry for it    |                 |      |      |
|                 | (there are tons |                 |      |      |
|                 | of good reasons |                 |      |      |
|                 | for this,       |                 |      |      |
|                 | including e.g.  |                 |      |      |
|                 | the             |                 |      |      |
|                 | `netscape -rem  |                 |      |      |
|                 | ote`{.literal}, |                 |      |      |
|                 | or              |                 |      |      |
|                 | `kfmclient ope  |                 |      |      |
|                 | nURL`{.literal} |                 |      |      |
|                 | kind of stuff). |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Com            | Tooltip for the | localestring    | NO   | 1-3  |
| ment`{.varname} | entry, for      |                 |      |      |
|                 | example \"View  |                 |      |      |
|                 | sites on the    |                 |      |      |
|                 | Internet\". The |                 |      |      |
|                 | value should    |                 |      |      |
|                 | not be          |                 |      |      |
|                 | redundant with  |                 |      |      |
|                 | the values of   |                 |      |      |
|                 | `               |                 |      |      |
|                 | Name`{.varname} |                 |      |      |
|                 | and             |                 |      |      |
|                 | `GenericN       |                 |      |      |
|                 | ame`{.varname}. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `               | Icon to display | iconstring      | NO   | 1-3  |
| Icon`{.varname} | in file         |                 |      |      |
|                 | manager, menus, |                 |      |      |
|                 | etc. If the     |                 |      |      |
|                 | name is an      |                 |      |      |
|                 | absolute path,  |                 |      |      |
|                 | the given file  |                 |      |      |
|                 | will be used.   |                 |      |      |
|                 | If the name is  |                 |      |      |
|                 | not an absolute |                 |      |      |
|                 | path, the       |                 |      |      |
|                 | algorithm       |                 |      |      |
|                 | described in    |                 |      |      |
|                 | the [Icon Theme |                 |      |      |
|                 | Specification[  |                 |      |      |
|                 | (http://free    |                 |      |      |
|                 | desktop.org/wik |                 |      |      |
|                 | i/Standards/ico |                 |      |      |
|                 | n-theme-spec)]{ |                 |      |      |
|                 | .ulink-url}](ht |                 |      |      |
|                 | tp://freedeskto |                 |      |      |
|                 | p.org/wiki/Stan |                 |      |      |
|                 | dards/icon-them |                 |      |      |
|                 | e-spec){.ulink} |                 |      |      |
|                 | will be used to |                 |      |      |
|                 | locate the      |                 |      |      |
|                 | icon.           |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Hi             | `Hi             | boolean         | NO   | 1-3  |
| dden`{.varname} | dden`{.varname} |                 |      |      |
|                 | should have     |                 |      |      |
|                 | been called     |                 |      |      |
|                 | `Dele           |                 |      |      |
|                 | ted`{.varname}. |                 |      |      |
|                 | It means the    |                 |      |      |
|                 | user deleted    |                 |      |      |
|                 | (at their       |                 |      |      |
|                 | level)          |                 |      |      |
|                 | something that  |                 |      |      |
|                 | was present (at |                 |      |      |
|                 | an upper level, |                 |      |      |
|                 | e.g. in the     |                 |      |      |
|                 | system dirs).   |                 |      |      |
|                 | It\'s strictly  |                 |      |      |
|                 | equivalent to   |                 |      |      |
|                 | the             |                 |      |      |
|                 | `.desk          |                 |      |      |
|                 | top`{.filename} |                 |      |      |
|                 | file not        |                 |      |      |
|                 | existing at     |                 |      |      |
|                 | all, as far as  |                 |      |      |
|                 | that user is    |                 |      |      |
|                 | concerned. This |                 |      |      |
|                 | can also be     |                 |      |      |
|                 | used to         |                 |      |      |
|                 | \"uninstall\"   |                 |      |      |
|                 | existing files  |                 |      |      |
|                 | (e.g. due to a  |                 |      |      |
|                 | renaming) - by  |                 |      |      |
|                 | letting         |                 |      |      |
|                 | `make ins       |                 |      |      |
|                 | tall`{.literal} |                 |      |      |
|                 | install a file  |                 |      |      |
|                 | with            |                 |      |      |
|                 | `Hidden=        |                 |      |      |
|                 | true`{.literal} |                 |      |      |
|                 | in it.          |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `OnlySho        | A list of       | string(s)       | NO   | 1-3  |
| wIn`{.varname}, | strings         |                 |      |      |
| `NotSh          | identifying the |                 |      |      |
| owIn`{.varname} | desktop         |                 |      |      |
|                 | environments    |                 |      |      |
|                 | that should     |                 |      |      |
|                 | display/not     |                 |      |      |
|                 | display a given |                 |      |      |
|                 | desktop entry.  |                 |      |      |
|                 |                 |                 |      |      |
|                 | By default, a   |                 |      |      |
|                 | desktop file    |                 |      |      |
|                 | should be       |                 |      |      |
|                 | shown, unless   |                 |      |      |
|                 | an OnlyShowIn   |                 |      |      |
|                 | key is present, |                 |      |      |
|                 | in which case,  |                 |      |      |
|                 | the default is  |                 |      |      |
|                 | for the file    |                 |      |      |
|                 | not to be       |                 |      |      |
|                 | shown.          |                 |      |      |
|                 |                 |                 |      |      |
|                 | If              |                 |      |      |
|                 | `$XDG_CURRENT_D |                 |      |      |
|                 | ESKTOP`{.envar} |                 |      |      |
|                 | is set then it  |                 |      |      |
|                 | contains a      |                 |      |      |
|                 | colon-separated |                 |      |      |
|                 | list of         |                 |      |      |
|                 | strings. In     |                 |      |      |
|                 | order, each     |                 |      |      |
|                 | string is       |                 |      |      |
|                 | considered. If  |                 |      |      |
|                 | a matching      |                 |      |      |
|                 | entry is found  |                 |      |      |
|                 | in              |                 |      |      |
|                 | `OnlySh         |                 |      |      |
|                 | owIn`{.varname} |                 |      |      |
|                 | then the        |                 |      |      |
|                 | desktop file is |                 |      |      |
|                 | shown. If an    |                 |      |      |
|                 | entry is found  |                 |      |      |
|                 | in              |                 |      |      |
|                 | `NotSh          |                 |      |      |
|                 | owIn`{.varname} |                 |      |      |
|                 | then the        |                 |      |      |
|                 | desktop file is |                 |      |      |
|                 | not shown. If   |                 |      |      |
|                 | none of the     |                 |      |      |
|                 | strings match   |                 |      |      |
|                 | then the        |                 |      |      |
|                 | default action  |                 |      |      |
|                 | is taken (as    |                 |      |      |
|                 | above).         |                 |      |      |
|                 |                 |                 |      |      |
|                 | `$XDG_CURRENT_D |                 |      |      |
|                 | ESKTOP`{.envar} |                 |      |      |
|                 | should have     |                 |      |      |
|                 | been set by the |                 |      |      |
|                 | login manager,  |                 |      |      |
|                 | according to    |                 |      |      |
|                 | the value of    |                 |      |      |
|                 | the             |                 |      |      |
|                 | `DesktopN       |                 |      |      |
|                 | ames`{.varname} |                 |      |      |
|                 | found in the    |                 |      |      |
|                 | session file.   |                 |      |      |
|                 | The entry in    |                 |      |      |
|                 | the session     |                 |      |      |
|                 | file has        |                 |      |      |
|                 | multiple values |                 |      |      |
|                 | separated in    |                 |      |      |
|                 | the usual way:  |                 |      |      |
|                 | with a          |                 |      |      |
|                 | semicolon.      |                 |      |      |
|                 |                 |                 |      |      |
|                 | The same        |                 |      |      |
|                 | desktop name    |                 |      |      |
|                 | may not appear  |                 |      |      |
|                 | in both         |                 |      |      |
|                 | `OnlySh         |                 |      |      |
|                 | owIn`{.varname} |                 |      |      |
|                 | and             |                 |      |      |
|                 | `NotSh          |                 |      |      |
|                 | owIn`{.varname} |                 |      |      |
|                 | of a group.     |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `DBusActivat    | A boolean value | boolean         | NO   |      |
| able`{.varname} | specifying if   |                 |      |      |
|                 | D-Bus           |                 |      |      |
|                 | activation is   |                 |      |      |
|                 | supported for   |                 |      |      |
|                 | this            |                 |      |      |
|                 | application. If |                 |      |      |
|                 | this key is     |                 |      |      |
|                 | missing, the    |                 |      |      |
|                 | default value   |                 |      |      |
|                 | is              |                 |      |      |
|                 | `fa             |                 |      |      |
|                 | lse`{.literal}. |                 |      |      |
|                 | If the value is |                 |      |      |
|                 | `               |                 |      |      |
|                 | true`{.literal} |                 |      |      |
|                 | then            |                 |      |      |
|                 | implementations |                 |      |      |
|                 | should ignore   |                 |      |      |
|                 | the             |                 |      |      |
|                 | `               |                 |      |      |
|                 | Exec`{.varname} |                 |      |      |
|                 | key and send a  |                 |      |      |
|                 | D-Bus message   |                 |      |      |
|                 | to launch the   |                 |      |      |
|                 | application.    |                 |      |      |
|                 | See [D-Bus      |                 |      |      |
|                 | Activa          |                 |      |      |
|                 | tion](dbus.html |                 |      |      |
|                 |  "8. D-Bus Acti |                 |      |      |
|                 | vation"){.link} |                 |      |      |
|                 | for more        |                 |      |      |
|                 | information on  |                 |      |      |
|                 | how this works. |                 |      |      |
|                 | Applications    |                 |      |      |
|                 | should still    |                 |      |      |
|                 | include Exec=   |                 |      |      |
|                 | lines in their  |                 |      |      |
|                 | desktop files   |                 |      |      |
|                 | for             |                 |      |      |
|                 | compatibility   |                 |      |      |
|                 | with            |                 |      |      |
|                 | implementations |                 |      |      |
|                 | that do not     |                 |      |      |
|                 | understand the  |                 |      |      |
|                 | DBusActivatable |                 |      |      |
|                 | key.            |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Try            | Path to an      | string          | NO   | 1    |
| Exec`{.varname} | executable file |                 |      |      |
|                 | on disk used to |                 |      |      |
|                 | determine if    |                 |      |      |
|                 | the program is  |                 |      |      |
|                 | actually        |                 |      |      |
|                 | installed. If   |                 |      |      |
|                 | the path is not |                 |      |      |
|                 | an absolute     |                 |      |      |
|                 | path, the file  |                 |      |      |
|                 | is looked up in |                 |      |      |
|                 | the \$PATH      |                 |      |      |
|                 | environment     |                 |      |      |
|                 | variable. If    |                 |      |      |
|                 | the file is not |                 |      |      |
|                 | present or if   |                 |      |      |
|                 | it is not       |                 |      |      |
|                 | executable, the |                 |      |      |
|                 | entry may be    |                 |      |      |
|                 | ignored (not be |                 |      |      |
|                 | used in menus,  |                 |      |      |
|                 | for example).   |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `               | Program to      | string          | NO   | 1    |
| Exec`{.varname} | execute,        |                 |      |      |
|                 | possibly with   |                 |      |      |
|                 | arguments. See  |                 |      |      |
|                 | the             |                 |      |      |
|                 | [`              |                 |      |      |
|                 | Exec`{.varname} |                 |      |      |
|                 | key](           |                 |      |      |
|                 | exec-variables. |                 |      |      |
|                 | html "7. The Ex |                 |      |      |
|                 | ec key"){.link} |                 |      |      |
|                 | for details on  |                 |      |      |
|                 | how this key    |                 |      |      |
|                 | works. The      |                 |      |      |
|                 | `               |                 |      |      |
|                 | Exec`{.varname} |                 |      |      |
|                 | key is required |                 |      |      |
|                 | if              |                 |      |      |
|                 | `DBusActivat    |                 |      |      |
|                 | able`{.varname} |                 |      |      |
|                 | is not set to   |                 |      |      |
|                 | `t              |                 |      |      |
|                 | rue`{.literal}. |                 |      |      |
|                 | Even if         |                 |      |      |
|                 | `DBusActivat    |                 |      |      |
|                 | able`{.varname} |                 |      |      |
|                 | is              |                 |      |      |
|                 | `t              |                 |      |      |
|                 | rue`{.literal}, |                 |      |      |
|                 | `               |                 |      |      |
|                 | Exec`{.varname} |                 |      |      |
|                 | should be       |                 |      |      |
|                 | specified for   |                 |      |      |
|                 | compatibility   |                 |      |      |
|                 | with            |                 |      |      |
|                 | implementations |                 |      |      |
|                 | that do not     |                 |      |      |
|                 | understand      |                 |      |      |
|                 | `DBusActivata   |                 |      |      |
|                 | ble`{.varname}. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `               | If entry is of  | string          | NO   | 1    |
| Path`{.varname} | type            |                 |      |      |
|                 | `Applicati      |                 |      |      |
|                 | on`{.constant}, |                 |      |      |
|                 | the working     |                 |      |      |
|                 | directory to    |                 |      |      |
|                 | run the program |                 |      |      |
|                 | in.             |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Term           | Whether the     | boolean         | NO   | 1    |
| inal`{.varname} | program runs in |                 |      |      |
|                 | a terminal      |                 |      |      |
|                 | window.         |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Act            | Identifiers for | string(s)       | NO   | 1    |
| ions`{.varname} | application     |                 |      |      |
|                 | actions. This   |                 |      |      |
|                 | can be used to  |                 |      |      |
|                 | tell the        |                 |      |      |
|                 | application to  |                 |      |      |
|                 | make a specific |                 |      |      |
|                 | action,         |                 |      |      |
|                 | different from  |                 |      |      |
|                 | the default     |                 |      |      |
|                 | behavior. The   |                 |      |      |
|                 | [Application    |                 |      |      |
|                 | actions](extr   |                 |      |      |
|                 | a-actions.html  |                 |      |      |
|                 | "11. Additional |                 |      |      |
|                 |  applications a |                 |      |      |
|                 | ctions"){.link} |                 |      |      |
|                 | section         |                 |      |      |
|                 | describes how   |                 |      |      |
|                 | actions work.   |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Mime           | The MIME        | string(s)       | NO   | 1    |
| Type`{.varname} | type(s)         |                 |      |      |
|                 | supported by    |                 |      |      |
|                 | this            |                 |      |      |
|                 | application.    |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Catego         | Categories in   | string(s)       | NO   | 1    |
| ries`{.varname} | which the entry |                 |      |      |
|                 | should be shown |                 |      |      |
|                 | in a menu (for  |                 |      |      |
|                 | possible values |                 |      |      |
|                 | see the         |                 |      |      |
|                 | [Desktop Menu   |                 |      |      |
|                 | Specification[  |                 |      |      |
|                 | (http://www.fre |                 |      |      |
|                 | edesktop.org/St |                 |      |      |
|                 | andards/menu-sp |                 |      |      |
|                 | ec)]{.ulink-url |                 |      |      |
|                 | }](http://www.f |                 |      |      |
|                 | reedesktop.org/ |                 |      |      |
|                 | Standards/menu- |                 |      |      |
|                 | spec){.ulink}). |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Implem         | A list of       | string(s)       | NO   |      |
| ents`{.varname} | interfaces that |                 |      |      |
|                 | this            |                 |      |      |
|                 | application     |                 |      |      |
|                 | implements. By  |                 |      |      |
|                 | default, a      |                 |      |      |
|                 | desktop file    |                 |      |      |
|                 | implements no   |                 |      |      |
|                 | interfaces. See |                 |      |      |
|                 | [Interf         |                 |      |      |
|                 | aces](interface |                 |      |      |
|                 | s.html "9. Inte |                 |      |      |
|                 | rfaces"){.link} |                 |      |      |
|                 | for more        |                 |      |      |
|                 | information on  |                 |      |      |
|                 | how this works. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `Keyw           | A list of       | localestring(s) | NO   | 1    |
| ords`{.varname} | strings which   |                 |      |      |
|                 | may be used in  |                 |      |      |
|                 | addition to     |                 |      |      |
|                 | other metadata  |                 |      |      |
|                 | to describe     |                 |      |      |
|                 | this entry.     |                 |      |      |
|                 | This can be     |                 |      |      |
|                 | useful e.g. to  |                 |      |      |
|                 | facilitate      |                 |      |      |
|                 | searching       |                 |      |      |
|                 | through         |                 |      |      |
|                 | entries. The    |                 |      |      |
|                 | values are not  |                 |      |      |
|                 | meant for       |                 |      |      |
|                 | display, and    |                 |      |      |
|                 | should not be   |                 |      |      |
|                 | redundant with  |                 |      |      |
|                 | the values of   |                 |      |      |
|                 | `               |                 |      |      |
|                 | Name`{.varname} |                 |      |      |
|                 | or              |                 |      |      |
|                 | `GenericN       |                 |      |      |
|                 | ame`{.varname}. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `StartupNo      | If true, it is  | boolean         | NO   | 1    |
| tify`{.varname} | KNOWN that the  |                 |      |      |
|                 | application     |                 |      |      |
|                 | will send a     |                 |      |      |
|                 | \"remove\"      |                 |      |      |
|                 | message when    |                 |      |      |
|                 | started with    |                 |      |      |
|                 | the             |                 |      |      |
|                 | DESKT           |                 |      |      |
|                 | OP\_STARTUP\_ID |                 |      |      |
|                 | environment     |                 |      |      |
|                 | variable set.   |                 |      |      |
|                 | If false, it is |                 |      |      |
|                 | KNOWN that the  |                 |      |      |
|                 | application     |                 |      |      |
|                 | does not work   |                 |      |      |
|                 | with startup    |                 |      |      |
|                 | notification at |                 |      |      |
|                 | all (does not   |                 |      |      |
|                 | shown any       |                 |      |      |
|                 | window, breaks  |                 |      |      |
|                 | even when using |                 |      |      |
|                 | StartupWMClass, |                 |      |      |
|                 | etc.). If       |                 |      |      |
|                 | absent, a       |                 |      |      |
|                 | reasonable      |                 |      |      |
|                 | handling is up  |                 |      |      |
|                 | to              |                 |      |      |
|                 | implementations |                 |      |      |
|                 | (assuming       |                 |      |      |
|                 | false, using    |                 |      |      |
|                 | StartupWMClass, |                 |      |      |
|                 | etc.). (See the |                 |      |      |
|                 | [Startup        |                 |      |      |
|                 | Notification    |                 |      |      |
|                 | Protocol        |                 |      |      |
|                 | Specification[  |                 |      |      |
|                 | (http://www.fre |                 |      |      |
|                 | edesktop.org/St |                 |      |      |
|                 | andards/startup |                 |      |      |
|                 | -notification-s |                 |      |      |
|                 | pec)]{.ulink-ur |                 |      |      |
|                 | l}](http://www. |                 |      |      |
|                 | freedesktop.org |                 |      |      |
|                 | /Standards/star |                 |      |      |
|                 | tup-notificatio |                 |      |      |
|                 | n-spec){.ulink} |                 |      |      |
|                 | for more        |                 |      |      |
|                 | details).       |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `StartupWMC     | If specified,   | string          | NO   | 1    |
| lass`{.varname} | it is known     |                 |      |      |
|                 | that the        |                 |      |      |
|                 | application     |                 |      |      |
|                 | will map at     |                 |      |      |
|                 | least one       |                 |      |      |
|                 | window with the |                 |      |      |
|                 | given string as |                 |      |      |
|                 | its WM class or |                 |      |      |
|                 | WM name hint    |                 |      |      |
|                 | (see the        |                 |      |      |
|                 | [Startup        |                 |      |      |
|                 | Notification    |                 |      |      |
|                 | Protocol        |                 |      |      |
|                 | Specification[  |                 |      |      |
|                 | (http://www.fre |                 |      |      |
|                 | edesktop.org/St |                 |      |      |
|                 | andards/startup |                 |      |      |
|                 | -notification-s |                 |      |      |
|                 | pec)]{.ulink-ur |                 |      |      |
|                 | l}](http://www. |                 |      |      |
|                 | freedesktop.org |                 |      |      |
|                 | /Standards/star |                 |      |      |
|                 | tup-notificatio |                 |      |      |
|                 | n-spec){.ulink} |                 |      |      |
|                 | for more        |                 |      |      |
|                 | details).       |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `URL`{.varname} | If entry is     | string          | YES  | 2    |
|                 | Link type, the  |                 |      |      |
|                 | URL to access.  |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `P              | If true, the    | boolean         | NO   | 1    |
| refersNonDefaul | application     |                 |      |      |
| tGPU`{.varname} | prefers to be   |                 |      |      |
|                 | run on a more   |                 |      |      |
|                 | powerful        |                 |      |      |
|                 | discrete GPU if |                 |      |      |
|                 | available,      |                 |      |      |
|                 | which we        |                 |      |      |
|                 | describe as "a  |                 |      |      |
|                 | GPU other than  |                 |      |      |
|                 | the default     |                 |      |      |
|                 | one" in this    |                 |      |      |
|                 | spec to avoid   |                 |      |      |
|                 | the need to     |                 |      |      |
|                 | define what a   |                 |      |      |
|                 | discrete GPU is |                 |      |      |
|                 | and in which    |                 |      |      |
|                 | cases it might  |                 |      |      |
|                 | be considered   |                 |      |      |
|                 | more powerful   |                 |      |      |
|                 | than the        |                 |      |      |
|                 | default GPU.    |                 |      |      |
|                 | This key is     |                 |      |      |
|                 | only a hint and |                 |      |      |
|                 | support might   |                 |      |      |
|                 | not be present  |                 |      |      |
|                 | depending on    |                 |      |      |
|                 | the             |                 |      |      |
|                 | implementation. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
| `SingleMainWi   | If true, the    | boolean         | NO   | 1    |
| ndow`{.varname} | application has |                 |      |      |
|                 | a single main   |                 |      |      |
|                 | window, and     |                 |      |      |
|                 | does not        |                 |      |      |
|                 | support having  |                 |      |      |
|                 | an additional   |                 |      |      |
|                 | one opened.     |                 |      |      |
|                 | This key is     |                 |      |      |
|                 | used to signal  |                 |      |      |
|                 | to the          |                 |      |      |
|                 | implementation  |                 |      |      |
|                 | to avoid        |                 |      |      |
|                 | offering a UI   |                 |      |      |
|                 | to launch       |                 |      |      |
|                 | another window  |                 |      |      |
|                 | of the app.     |                 |      |      |
|                 | This key is     |                 |      |      |
|                 | only a hint and |                 |      |      |
|                 | support might   |                 |      |      |
|                 | not be present  |                 |      |      |
|                 | depending on    |                 |      |      |
|                 | the             |                 |      |      |
|                 | implementation. |                 |      |      |
+-----------------+-----------------+-----------------+------+------+
:::
:::
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[The `Exec`{.varname}
key]{.nav-label}](exec-variables.html){.nav-link}[[←]{.prev-icon}[Localized
values for keys]{.nav-label}](localized-keys.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</recognized-keys>
---


<value-types>

::: {.bypass-block}
[Jump to content](#_content)[Jump to page navigation: previous page
\[access key p\]/next page \[access key n\]](#_bottom-navigation)
:::

::: {#_outer-wrap}
::: {#_white-bg}
::: {#_header}
::: {#_logo}
[![Freedesktop
Logo](static/images/logo.svg)](https://specifications.freedesktop.org/)
:::

::: {.crumbs}
[[]{.single-contents-icon}Possible value
types](value-types.html){.single-crumb}

::: {.bubble-corner .active-contents}
:::
:::

::: {.clearme}
:::
:::
:::

::: {#_toolbar-wrap}
::: {#_toolbar}
::: {#_toc-area .inactive}
[[[Contents]{.toc-icon}[]{.clearme}]{.tool-spacer}[Contents]{.tool-label}](index.html "Contents"){#_toc-area-button
.tool}

::: {.active-contents .bubble-corner}
:::

::: {.active-contents .bubble}
::: {.bubble-container}
###### Desktop Entry Specification

::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_nav-area .inactive}
::: {.tool}
[[Navigation]{.tool-label}[[←]{.prev-icon}](basic-format.html "3. Basic format of the file"){.tool-spacer}[[→]{.next-icon}](localized-keys.html "5. Localized values for keys"){.tool-spacer}]{.nav-inner}
:::
:::
:::
:::

::: {#_fixed-header-wrap .inactive}
::: {#_fixed-header}
::: {.crumbs}
[[]{.single-contents-icon}Show Contents: Possible value
types](value-types.html){.single-crumb}
:::

::: {.buttons}
[Top](#){.top-button .button}

::: {.button}
[[←]{.prev-icon}](basic-format.html "3. Basic format of the file"){.tool-spacer}[[→]{.next-icon}](localized-keys.html "5. Localized values for keys"){.tool-spacer}
:::

::: {.clearme}
:::
:::

::: {.clearme}
:::
:::

::: {.active-contents .bubble}
::: {.bubble-container}
::: {#_bubble-toc}
1.  [[1 ]{.number}[Introduction]{.name}](index.html#introduction)
2.  [[2 ]{.number}[File naming]{.name}](file-naming.html)
3.  [[3 ]{.number}[Basic format of the file]{.name}](basic-format.html)
4.  [[4 ]{.number}[Possible value types]{.name}](value-types.html)
5.  [[5 ]{.number}[Localized values for
    keys]{.name}](localized-keys.html)
6.  [[6 ]{.number}[Recognized desktop entry
    keys]{.name}](recognized-keys.html)
7.  [[7 ]{.number}[The `Exec`{.varname}
    key]{.name}](exec-variables.html)
8.  [[8 ]{.number}[D-Bus Activation]{.name}](dbus.html)
9.  [[9 ]{.number}[Interfaces]{.name}](interfaces.html)
10. [[10 ]{.number}[Registering MIME Types]{.name}](mime-types.html)
11. [[11 ]{.number}[Additional applications
    actions]{.name}](extra-actions.html)
12. [[12 ]{.number}[Extending the format]{.name}](extending.html)
13. [[A ]{.number}[Example Desktop Entry File]{.name}](example.html)
14. [[B ]{.number}[Currently reserved for use within
    KDE]{.name}](kde-items.html)
15. [[C ]{.number}[Deprecated Items]{.name}](deprecated-items.html)
16. [[D ]{.number}[The `Legacy-Mixed`{.constant} Encoding
    (Deprecated)]{.name}](legacy-mixed.html)
17. [[E ]{.number}[Changes to this Specification]{.name}](ape.html)
:::

::: {.clearme}
:::
:::
:::
:::

::: {#_toc-bubble-wrap}
:::

::: {#_content}
::: {.documentation}
::: {#value-types .sect1}
::: {.titlepage}
<div>

<div>

[4 ]{.number}[Possible value types]{.name dm="urn:x-suse:ns:docmanager"} [\#](value-types.html "Permalink"){.permalink} {#value-types .title}
-----------------------------------------------------------------------------------------------------------------------

</div>

</div>
:::

The value types recognized are `string`{.literal},
`localestring`{.literal}, `iconstring`{.literal}, `boolean`{.literal},
and `numeric`{.literal}.

::: {.itemizedlist}
-   Values of type `string`{.literal} may contain all ASCII characters
    except for control characters.

-   Values of type `localestring`{.literal} are user displayable, and
    are encoded in UTF-8.

-   Values of type `iconstring`{.literal} are the names of icons; these
    may be absolute paths, or symbolic names for icons located using the
    algorithm described in the [Icon Theme Specification[
    (http://freedesktop.org/wiki/Standards/icon-theme-spec)]{.ulink-url}](http://freedesktop.org/wiki/Standards/icon-theme-spec){.ulink}.
    Such values are not user-displayable, and are encoded in UTF-8.

-   Values of type `boolean`{.literal} must either be the string
    `true`{.literal} or `false`{.literal}.

-   Values of type `numeric`{.literal} must be a valid floating point
    number as recognized by the `%f`{.literal} specifier for
    `scanf`{.function} in the `C`{.literal} locale.
:::

The escape sequences `\s`{.literal}, `\n`{.literal}, `\t`{.literal},
`\r`{.literal}, and `\\`{.literal} are supported for values of type
`string`{.literal}, `localestring`{.literal} and `iconstring`{.literal},
meaning ASCII space, newline, tab, carriage return, and backslash,
respectively.

Some keys can have multiple values. In such a case, the value of the key
is specified as a plural: for example, `string(s)`{.literal}. The
multiple values should be separated by a semicolon and the value of the
key may be optionally terminated by a semicolon. Trailing empty strings
must always be terminated with a semicolon. Semicolons in these values
need to be escaped using `\;`{.literal}.
:::
:::

::: {.page-bottom}
::: {#_bottom-navigation}
[[→]{.next-icon}[Localized values for
keys]{.nav-label}](localized-keys.html){.nav-link}[[←]{.prev-icon}[Basic
format of the file]{.nav-label}](basic-format.html){.nav-link}
:::
:::
:::

::: {#_inward}
:::
:::

::: {#_footer-wrap}
::: {#_footer}
© 2025 Freedesktop.org
:::
:::

</value-types>
---

