RideType = GraphQL::ObjectType.define do
 name "Ride"
  description "A Ride"
  field :id, types.ID
  field :startL, types.String
  field :endL, types.String
  field :startT, types.String
  field :endT, types.String
  field :transForm, types.String
  field :user do
    type UserType
    resolve -> (ride, args, ctx) {
      ride.user
    }
  end
end