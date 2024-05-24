for i, v in pairs(game:GetDescendants()) do
    if v:IsA("TextLabel") and v.Name == "Explorer" then
        print(v.Parent)
        v.Text = v.Text .. " | Patched"
    end
end