class Prcess < ActiveRecord::Base
  acts_as_nested_set
end

# Methods names are aligned on Tree’s ones as much as possible, to make replacment from one by another easier, except for the creation:
# 
# in acts_as_tree:
# 
#   item.children.create(:name => "child1")
# in acts_as_nested_set:
# 
#   # adds a new item at the "end" of the tree, i.e. with child.left = max(tree.right)+1
#   child = MyClass.new(:name => "child1")
#   child.save
#   # now move the item to its right place
#   child.move_to_child_of my_item
# You can use:
# 
# move_to_child_of
# move_to_right_of
# move_to_left_of
# and pass them an id or an object.
# 
# Other methods added by this mixin are:
# 
# root - root item of the tree (the one that has a nil parent; should have left_column = 1 too)
# roots - root items, in case of multiple roots (the ones that have a nil parent)
# level - number indicating the level, a root being level 0
# ancestors - array of all parents, with root as first item
# self_and_ancestors - array of all parents and self
# siblings - array of all siblings, that are the items sharing the same parent and level
# self_and_siblings - array of itself and all siblings
# children_count - count of all immediate children
# children - array of all immediate childrens
# all_children - array of all children and nested children
# full_set - array of itself and all children and nested children
# These should not be useful, except if you want to write direct SQL:
# 
# left_col_name - name of the left column passed on the declaration line
# right_col_name - name of the right column passed on the declaration line
# parent_col_name - name of the parent column passed on the declaration line
# recommandations: Don‘t name your left and right columns ‘left’ and ‘right’: these names are reserved on most of dbs. Usage is to name them ‘lft’ and ‘rgt’ for instance.
