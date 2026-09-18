# Time Saver

Timesheet consolidation engine: raw time entries in, grouped billing lines out, multiple
destinations. Design doc lives in the Timesheet Automation project.

## Object ID allocation

Reserved inside the app's 70000..70999 range. Keep Time Saver objects inside these blocks
so the folder can be lifted into its own app later without renumbering anything else.

| Block | Object type | Used |
| --- | --- | --- |
| 70000-70019 | Tables | 70000-70005 |
| 70100-70119 | Enums | 70100-70105 |
| 70200-70259 | Pages | none yet |
| 70300-70319 | Codeunits | none yet |
| 70400-70419 | Reports / XMLports | none yet |

Object IDs are namespaced per object type in AL, so table 70000 and enum 70100 could
both have been 70000. They are kept distinct to save confusion when reading logs.

## Objects so far

| ID | Object | Purpose |
| --- | --- | --- |
| 70000 | KVS Time Entry Buffer | Raw source entries, read-only, re-importable |
| 70001 | KVS Project Time Jnl. Line | The editable layer; cleared on posting |
| 70002 | KVS Project Time Entry | Posted; what every output reads |
| 70003 | KVS Time Saver Setup | Week start, week numbering, day boundary, defaults |
| 70004 | KVS Time Grouping Rule | Which fields form the grouping key |
| 70005 | KVS Time Source Mapping | Replaces the .ini mapping files |

## Decisions visible in the code

- The buffer has no Status field and no edit path. Read-only is enforced on the pages.
- The journal line has no template or batch. Added later if more than one person ever
  works lines at the same time.
- Posting clears the journal line. No Status, no Unlock, no reversal.
- On the posted entry, everything is Editable = false except Work Description,
  Invoice Description and Jira Issue Key - the presentation fields. That is what allows
  re-wording for Jira after FreeAgent already has the line.
- Enums are Extensible = true except Week Start Day, so a later connector can add its
  own source type without a code change here.

## To verify on first compile

- `TableRelation = Job` and `"Job Task"` - the AL table names are still Job and Job Task;
  only the UI terminology became Project. Confirm against the symbols in this project.
- `TableRelation = User."User Name"` on Posted By - validation is switched off, so this is
  a lookup convenience rather than a constraint.
- `Source Description` is Text[250]. Long ClickUp descriptions will truncate; if that bites,
  it becomes a Blob and the pages get a multiline control.

## Not built yet

Pages, the Create Lines routine, posting, and every output. Next up is Create Lines plus
Merge, Split and posting - the piece that removes the bottleneck.
