Feature: Check for bare attribute keys

  In order to ensure my cookbook attributes are easily understood
  As a developer
  I want to avoid referring to bare attributes

  Scenario Outline: Cookbook attributes
    Given a cookbook attributes file that refers to an attribute with <reference>
     When I check the cookbook
     Then the bare attribute keys warning 044 <show_warning> be displayed against the attributes file
  Examples:
    | reference        | show_warning |
    | node['hostname'] | should not   |
    | node[:hostname]  | should not   |
    | node.hostname    | should not   |
    | hostname         | should       |
    | true             | should not   |
    | false            | should not   |
    | nil              | should not   |

  Scenario: Cookbook recipe
    Given a cookbook recipe that refers to an attribute with a bare keyword
     When I check the cookbook
     Then the bare attribute keys warning 044 should not be displayed

  Scenario: Variable declared in attributes file
    Given a cookbook attributes file that declares and refers to a local variable
     When I check the cookbook
     Then the bare attribute keys warning 044 should not be displayed against the local variable
