$execute store result score #bw_try overlimit.const run locate structure $(kind)
execute if score #bw_try overlimit.const matches 1.. if score #bw_try overlimit.const < #bw_best overlimit.const run function overlimit:portal/survey_take
