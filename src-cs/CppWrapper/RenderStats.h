// RenderStats.h
// this file is part of Context Free
// ---------------------
// Copyright (C) 2022 John Horigan - john@glyphic.com
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
// 
// John Horigan can be contacted at john@glyphic.com or at
// John Horigan, 1209 Villa St., Mountain View, CA 94041-1123, USA
//
//


#pragma once

namespace CppWrapper {
    public value class RenderStats
    {
    public:
        bool    updateRender;   // stat pointer was null
        int     shapeCount;     // finished shapes in image
        int     toDoCount;      // unfinished shapes still to expand

        bool    inOutput;       // true if we are in the output loop
        bool    fullOutput;     // not an incremental output
        bool    finalOutput;    // the last output
        bool    showProgress;
        int     outputCount;    // number to be output
        int     outputDone;     // number output so far
        __int64 outputTime;

        bool    animating;      // inside the animation loop
    };
}
