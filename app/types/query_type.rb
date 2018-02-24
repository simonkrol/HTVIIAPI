QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :rides do
    type types[RideType]
    resolve -> (obj, args, ctx) {
      Ride.all
    }
  end
  field :users do
    type types[UserType]
    resolve -> (obj, args, ctx) {
      User.all
    }
  end
end