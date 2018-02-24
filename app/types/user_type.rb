UserType = GraphQL::ObjectType.define do
 name "User"
  description "A User"
  field :id, types.ID
  field :name, types.String
  field :surname, types.String
  field :ccHash, types.String
  field :email, types.String
  field :age, types.Int
  field :rides do
    type types[RideType]
    resolve -> (user, args, ctx) {
      user.rides
    }
  end
end
