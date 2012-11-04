fancytable
===========
[![Build Status](https://travis-ci.org/calebthompson/fancytable.png)](https://travis-ci.org/calebthompson/fancytable)

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/calebthompson/fancytable)

Tables. Done right.

BOOM!
-----

```erb
<%= fancy_table @firefly_episodes %>
```

![fancytable of Firefly
episodes](https://github.com/calebthompson/fancytable/raw/master/firefly-episodes.png)

Okay, you've piqued my interest. What's going on here?
-------------------------------------------

FancyTable allows you to easily turn an `ActiveRecord::Relation` into a semantic
HTML5 table which supports sorting, pagination, and links for actions to be
posted back to the controller.

Besides automagic generation of the table from the ActiveRecord::Relation, the
killer feature is probably sorting on the server-side (_read: vroom!_). This is
done by clicking on headers and uses SmartOrder (see below).

If it's so easy, how do I do it?
--------------------------------

Great question. A lot of effort was put into making the developer—that's
you—happy. To that end, much of fancytable's syntax had been wrapped into two
calls.

### _In the controller:_

```ruby
def index
  @firefly_episodes = FireflyEpisode.scoped
  @firefly_episodes = FancyTable.build_fancy_table(@firefly_episodes)
end
```

### _Then in a view:_

```haml
= fancy_table @firefly_episodes
```

What if I want to do...
-----------------------

We've probably got you covered. Let's take a look at the optional arguments for
`build_fancy_table` in the controller, and their default values.

### actions

Actions appear in the FancyTable's `<caption>` as links. Actions are useful for
things which do not relate to specific objects, such as creating a new entry.

The format fairly simple:

```ruby
actions: { "Link text" => path }
```

### member_actions

Member Actions appear as links in the row with the model in the last `<td>`.
These should be used for object-specific actions, such as edit or delete.

Simple actions can be formatted similarly to the `actions` option above:

```ruby
member_actions: [:edit]
```

Which will render a link to `edit_model_path` by inferring that you mean to go to
`[action]_object_path`.

You can also pass a hash of member actions, in the format

```
member_actions: { "Display" => :action }
```

By default there are no member actions.

I don't like how it looks.
--------------------------

Sticks and stones, friend.

FancyTables are semantic HTML5, so they are just as easy to style as any other
html `<table>`, and probably easier.

The basic format of a FancyTable is:

```html
<table class="fancy-table">
  <caption>
    <h2>Users</h2>
    <div class="actions">
      <a href="/new_user_path">New User</a>
    </div>
  </caption>
  <thead>
    <th><a href="?order_by=title">Name</a></th>
    <th><a href="?order_by=favorite_color">Favorite Color</a></th>
    <th class="member-action"></th>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href="/users/1">Caleb</a>
      </td>
      <td>
        Blue
      </td>
      <td class="member-action">
        <a href="users/1/edit">Edit</a>
      </td>
    </tr>
  </tbody>
</table>
```

SmartOrder
----------

The heavy lifting of sorting FancyTables is done server-side in the model. To
accomplish this, we include the SmartOrder module in our models.

You have a couple of options here. If you plan to use FancyTable extensively
through your application, you can include SmartOrder in ActiveRecord::Base in an
initializer:

```ruby
class ActiveRecord::Base
  include SmartOrder::Sortable
end
```

If you are only going to use FancyTable in one or two places—or if you don't
like the idea of extending Rails core classes, you can include it in specific
models as well:

```ruby
class Book < ActiveRecord::Base
  include SmartOrder::Sortable
  # The rest of your model code
end
```
