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
      #User.all
      puts(ctx[:variable])
      #User.find_by(name:ctx[:context])
      #User.find(0)
      #User.all
      #User.find((int)ctx[:variable])
      User.where(email: ctx[:variable])
    }
  end
end