using BooleanInference
using Test

@testset "vec2tensor" begin
    a = rand(2,2,2,2)
    b = vec(a)
    c = vec2tensor(b)
    @test a == c
end

@testset "get_tensor_number" begin
    a = rand(2,2,2,2)
    b = vec(a)
    test_tag = true
    for i in CartesianIndices(a)
        test_tag = (get_tensor_number(b, collect(i.I)) == a[i]) && test_tag
    end
    @test test_tag
end

@testset "slice_tensor" begin
    a = reshape(1:32, 2,2,2,2,2)
    b = vec(a)
    subb = slice_tensor(b, [2,4,5], [2,1,1], 5)
    suba = a[:,2,:,1,1]
    @test subb == vec(suba)
end