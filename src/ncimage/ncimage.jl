export NCDImage
export isopen

#@with_kw mutable struct NCImage{T,N} <: AbstractEHTImage{T,N}
@with_kw mutable struct NCImage <: AbstractEHTImage
    data = nothing
    mjd = nothing
    freq = nothing
    pol = nothing
    metadata = nothing
    filename = nothing
    group = nothing
    dataset = nothing
end
#NCImage(Args...) = NCImage{Float64,5}(Args...)

# NCImage is a disk-based image data
isdiskimage(image::NCImage) = IsDiskImage()

@inline function Base.getindex(image::NCImage, I...)

end

function isopen(image::NCImage)::Bool
    if isnothing(image.dataset)
        return false
    end

    if image.dataset.ncid < 0
        return false
    else
        return true
    end
end