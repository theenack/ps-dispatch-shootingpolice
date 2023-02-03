local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
PlayerJob = {}

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    currentCallSign = ""
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(JobInfo)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = JobInfo
end)


Then, where it says

if (not isPlayerWhitelisted or Config.Debug) then


Replace that with

if PlayerJob.name ~= "police" then
