-- name: get-users-amounts
-- @param java.util.Set<Long> usersIds
-- @param java.util.Set<Integer> refillTypes
-- @param java.util.Set<Integer> withdrawalTypes
-- @param java.util.Set<Integer> betTypes
-- @param java.util.Set<Integer> winTypes
-- @param java.util.Set<Integer> bonusTypes
-- @param java.util.Set<Integer> bonusWageringTypes
-- @param java.util.Set<Integer> allTypes

select
       sum(if(type in (:refillTypes), amount, 0))           as refillAmount, --@type java.math.BigDecimal
       sum(if(type in (:withdrawalTypes), amount, 0))       as withdrawalAmount, --@type java.math.BigDecimal
       sum(if(type in (:betTypes), amount, 0))              as betAmount, --@type java.math.BigDecimal
       sum(if(type in (:winTypes), amount, 0))              as winAmount, --@type java.math.BigDecimal
       sum(if(type in (:bonusTypes), amount, 0))            as bonusAmount, --@type java.math.BigDecimal
       sum(if(type in (:bonusWageringTypes), amount, 0))    as bonusWageringAmount, --@type java.math.BigDecimal
       sum(if(type in (:bonusRejectionTypes), amount, 0))   as bonusRejectedAmount, --@type java.math.BigDecimal
       currency,
       user_id
from user_final_amounts_aggregator
         use index (user_id_type_idx)
where user_id in (:usersIds)
  AND currency > 0
  AND type in (:allTypes)
group by currency, user_id

having (refillAmount+withdrawalAmount+betAmount+winAmount+bonusAmount+bonusWageringAmount+bonusRejectedAmount) > 0
;
