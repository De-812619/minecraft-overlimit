# overlimit:tick_loop — Fabric では #minecraft:tick が動かないことがあるため schedule で回す
function overlimit:tick
schedule function overlimit:tick_loop 1t replace
